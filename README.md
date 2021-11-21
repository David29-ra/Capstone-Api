# Proyect Capstone API

This project is a RESTful API develop with Ruby on Rails for the Capstone project, the project is about places to buy or rent(like an airbnb).


1. The data bases are in PostgreSQL.
2. Models are: User, Property, Favorite (relation if an user make favorite some property), and Contact(relation if an user call with a landlor).
    * User:
        * id: integer
        * name: string
        * email: string
        * password: string
        * phone: string
        * role: integer (0 for seeker, 1 for landlord)
<br></br>
    * Property:
        * id: integer
        * address: string
        * price: integer
        * maintance: integer
        * beds: integer
        * baths: integer
        * area: float
        * pets: boolean
        * description: text
        * property_type: integer (0 for apartment, 1 for house)
        * operation_type: integer (0 for rent, 1 for sale)
        * status: integer (0 for active, 1 for closed)
        * user_id: bigint (user is landlord)
        * photo: url
<br></br>

    * Favorite:
        * id: integer
        * user_id: bigint
        * property_id: bigint
<br></br>
    * Contact:
        * id: integer
        * user_id: bigint
        * property_id: bigint

## To Start

In this the project use Docker Container and Docker Compose to run the project.

1. Clone the repository in your computer.

2. Open the folder Capstone-Api in a code editor.

3. Create an .env file and fill it with your GitHub credentials.

```env
GIT_USER_NAME=Example-mail
GIT_USER_EMAIL=example@mail.com
```
4. In the terminal run (you have to located in the Capstone-Api folder):
```bash
$ sudo docker-compose up
```

5. Open another terminal and run:
```bash
$ sudo docker-compose exec client bash
```
when you see something like this:

![client](/Capstone-Api/screen/view1.png)

you are in good way.

6. Now you hahve to install the gems:
```bash
$ bundle install
```
then
```bash
$ bundle update
```

7. Now it is time to run the migrations
```bash
$ rails db:migrate
```

8. Finally, you can run the server:
```bash
$ rails s -b 0.0.0.0
```

## Finally

You can open your localhost in your browser and you can see the project.

http://localhost:3000

![ror](/Capstone-Api/screen/ror.png)


## To Stop

1. In the terminal use Ctrl + C to stop the server.

## To Test the API

1. You can use the insomnia to test the API.
    * use the insomnia_capstone.json file to test the API.
    * Remember to have running the server.


<br/><br/>
### Ready, you can enjoy!

<br/><br/>

*Made by Monito Inc. 🙊*

*Made by Dulces123*

*Made by JosHeredia26*
