All the files under atom/test are used to run the automated testing that is needed when requesting that an offering becomes
public.  To run the testing do the following (the tests will take a long time to run):

$ docker run -v ${HOME}:/root -it azuresdk/azure-cli-python:0.2.8

#these are run within the docker container
$ az login
$ cd <azuremkpl-git-dir>/atom/tests
$ ./runTests.sh

#these are run on your host machine because you need the zip command (not docker)
$ cd <azuremkpl-git-dir>/atom/tests
$ cd logs
$ zip ../logs.zip *


  [![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fofficialboomi%2Fazure-atom-quickstart%2Fmain%2Fatom%2FmainTemplate.json/createUIDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2Fofficialboomi%2Fazure-atom-quickstart%2Fmain%2Fatom%2FcreateUiDefinition.json)

