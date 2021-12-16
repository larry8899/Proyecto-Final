from tabulate import tabulate
import requests, json
def mainMenu():
    next = True
    while(next):
        optionOk = False
        while(not optionOk):
            print(" Main Menu ")
            print("1-Insert")
            print("2-Read")
            print("3-Update")
            print("4-Update")
            print("5 exit")

   
            option = int(input("Select an option:"))
    
    
            if option < 1 or option > 5:
                print("wrong choice, insert again")

            elif option == 5:
                next = False
                print("Thanks for using this app")
                break
            else:
                optionOk=True
                executeOption(option)
       
def executeOption(option):
    if option == 1:
        
        url = "http://localhost:58724/api/Naves"
        payload = {"nombre": "1","descripcion": "1","estatus": True,"idCaracteristicasNave": "1","idMision": "1"
        }
        response = requests.post(url, json=payload)
        print(response.status_code)

    if option == 2:

        url = "http://localhost:58724/api/Naves"
        response = requests.get(url)
        data = response.json()
        print(tabulate(data,headers='keys',tablefmt='fancy_grid'))

    if option == 3:
        
        url = "http://localhost:58724/api/Naves/1"
        payload = {"idNave":"1","nombre": "juan","descripcion": "1","estatus": True,"idCaracteristicasNave": "1","idMision": "1"
        }
        response = requests.put(url, json=payload)
        print(response.status_code)

    if option == 4:
        
        url = "http://localhost:58724/api/Naves/7"
        response = requests.delete(url)
        print(response.status_code)
    
      
mainMenu()
   
                