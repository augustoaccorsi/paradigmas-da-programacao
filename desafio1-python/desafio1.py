# -*- coding: utf-8 -*-
import random

#funcao principal que executa o programa
def main():
  dirs = (0,0,0,0) #tipo de dados tuple para controlar as direcoes

  '''locais do Jedi housing
  tipo de dados utilizado: dict (colecao do tipo dicionario com propriedades e valores)
  ver tutorial: https://docs.python.org/3/library/stdtypes.html#typesmapping
  '''
  entrance = {'name': 'Entrada','directions':dirs,'msg':''}
  livingroom = {'name': 'Sala de Estar','directions':dirs,'msg':''}
  kitchen = {'name': 'Cozinha','directions':dirs,'msg':''}
  jedistudyroom = {'name': 'Sala de Estudos','directions':dirs,'msg':''}
  jediboysroom = {'name': 'Dormitório dos meninos Jedi','directions':dirs,'msg':''}
  jedigirlsroom = {'name': 'Dormitório das meninas Jedi','directions':dirs,'msg':''}

  #definição das direcoes de cada local (N,L,S,O) conforme o mapa
  entrance['directions'] = (0,livingroom,0,0)
  livingroom['directions'] = (jedistudyroom,jedigirlsroom,kitchen,entrance)
  kitchen['directions'] = (livingroom,0,0,0)
  jedistudyroom['directions'] = (0,jediboysroom,livingroom,0)
  jediboysroom['directions'] = (0,0,jedigirlsroom,jedistudyroom)
  jedigirlsroom['directions'] = (jediboysroom,0,0,livingroom)

  #definicao de onde o sabre de luz pode estar
  # tipo de dados utilizado: list
  #https://docs.python.org/3/tutorial/introduction.html#lists
  rooms = [livingroom,kitchen,jedistudyroom,jediboysroom,jedigirlsroom]
  room_with_lightsaber = random.choice(rooms) #aqui estamos usando o random para mudar o local do sabre em cada jogada
  lightsaber_found = False
  room = entrance
  while True:
    select = input("Digite o movimento: ")
    if select == 'N ':
        select = 0
    elif select == 'L':
        select = 1
    elif select == 'S':
        select = 2
    elif select == 'O':
        select = 3
    if room['directions'][select] is not 0:
        room = room['directions'][select]
        if room == room_with_lightsaber:
            print("encontrou")
            return
        else:
            print(room['name'])
  print('Bem-vindo Padawan! Você consegue localizar onde está o seu sabre de luz?')

#executa a função main
main()
