# Placa Mercosul

Convert car license plates not mercosul for car license plates pattern mercosul 

## Getting Started

**I am consider you are using [nanobox](https://guides.nanobox.io/elixir/phoenix/from-scratch/)**

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

```bash
git clone https://github.com/krlsdu/placamercosul.git
cd placamercosul
nanobox run 
cd assets && npm install
cd /app
mix ecto.create
mix ecto.migrate
mix deps.get

exit

nanobox run mix phx.server
nanobox dns add local phoenix.local
```
Visit your app at <a href="http://phoenix.local:4000" target="\_blank">phoenix.local:4000</a>



See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

If you use [nanobox](https://guides.nanobox.io/elixir/phoenix/from-scratch/)
all step in getting start is enougth, with you wish DIY, this is the list you need install

[elixir ~> 1.5.3](https://elixir-lang.org/install.html)

[npm ~> 5.6.0](https://github.com/creationix/nvm#installation)

[phoenix framework ~> 1.3.2](https://hexdocs.pm/phoenix/installation.html#content)

[postgres ~> 10.3](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04)


### Installing

I insist use [nanobox](https://guides.nanobox.io/elixir/phoenix/from-scratch/).

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

In project folder

```
mix test
```

### Break down into end to end tests

Explain what these tests test and why

```
All test control,model,view
```

### Coding style


All elixir up version 1.5 have a tool to apply code style format default from the language run the command in project folder

```
mix format
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc

