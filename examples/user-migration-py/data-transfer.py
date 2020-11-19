import json
import pymysql
import requests
import configparser
import time

from datetime import datetime
from requests.api import head, request

config = configparser.ConfigParser()
config.read('configuration.ini')

# Return DB Connection
def getConnection():
  db = pymysql.connect(host=config['DB']['HOST'], port=3306, user=config['DB']['USERNAME'], passwd=config['DB']['PASSWORD'], db=config['DB']['DB'], charset='utf8', autocommit=False)

  return db
# Get AccessToken from keycloak
def getToken():
  tokenUrl = 'http://localhost:8181/auth/realms/' + config['KEYCLOAK']['REALM'] + '/protocol/openid-connect/token'

  res = requests.post(tokenUrl, data={ 
    'grant_type': 'client_credentials',
    'client_id': config['KEYCLOAK']['CLIENT_ID'], 
    'client_secret': config['KEYCLOAK']['CLIENT_SECRET'] })
  return res.json()['access_token']



# Generate body 
def makeBody():
  
  db = getConnection()

  cursor = db.cursor()
  cursor.execute("""
      select 
        tu.user_seq,
        tu.user_email,
        tu.register_date,
        tu.user_email_received_yn,
        tu.user_id,
        tu.user_login_platform_type,
        tu.user_password,
        ujpc.user_join_reason,
        tu.user_nickname
      from 
        T_USER tu 
      left outer join 
        T_USER_JOIN_PATH_CODE ujpc 
      on 
        tu.user_join_path_code_seq = ujpc.user_join_reason
      WHERE 
        del_yn = 'N'
        and user_seq not in (select user_seq from t_user tu where user_id like '%@%.%' and del_yn = 'N' and user_login_platform_type in ('google','naver'))
        and user_seq > 18703
  """)
  accessToken = getToken()
  
  file = None
  
  for i, d in enumerate(cursor.fetchall()):
    if (i % 100) == 0 :
      file = open("C:/ws/msa-keycloak/custom-spi-source/test/TextFile.txt", "a")
    if (i % 500) == 0 : 
      accessToken = getToken()
      
    
    param = {}
    param['email'] = d[1]

    param['emailVerified'] = True
    param['enabled'] = True
    # param['createdTimestamp'] = int(d[2].timestamp()*1000)
    param['username'] = d[4]

    param['attributes'] = {
      'userSeq': d[0],
      'emailReceivingStatus': None if d[3] == "N" else "Y",
      'joinPath' : d[7],
      'nickname': d[8],
      "picture" : "https://static.some.co.kr/sometrend/images/mypage/profile/m_01.png",
      "certificateYn":"N",
      "registerDate" : int(d[2].timestamp()*1000)
    }
    print("userSeq : " + str(d[0]) + " >>>>  " + d[4] + " =>>> " + d[5])
    file.write("userSeq : " + str(d[0]) + " >>>>  " + d[4] + " =>>> " + d[5] + "\n")
    if d[5] == 'local': 
      param['credentials'] = [{
        "temporary": False,
        'type': 'password',
        "credentialData": '{"hashIterations":-1,"algorithm":"bcrypt"}',
        "secretData": '{"value":"'+ d[6] +'","salt":""}'
      }]
    elif d[5] == 'google': 
      param['federatedIdentities'] =   [{
        'identityProvider':"custom-google",
        'userId':param['username'],
        'userName' : param['username']
      }]
      param['attributes']["website"] = "google"
    elif d[5] == 'naver' :
      param['federatedIdentities'] =   [{
        'identityProvider':"naver",
        'userId':param['username'],
        'userName' : param['username']
      }]
      param['attributes']["website"] = "naver"

    
    headers = { 'Content-Type': 'application/json; charset=utf-8', 'Authorization': "Bearer "+accessToken }
    apiUrl = 'http://localhost:8181/auth/admin/realms/' + config['KEYCLOAK']['REALM'] + '/users'
    response = requests.post(apiUrl, data=json.dumps(param), headers=headers)
    print(response.text)
    file.write(response.text + "\n")
    if (i % 100) == 99 :
      file.close()
  
if __name__ == '__main__':  
  makeBody()
