*** Settings ***

Documentation            Esse será nosso gerenciador de dependencias.

Library                  SeleniumLibrary
Library                  RequestsLibrary

##########################
#        keywords        #
##########################
Resource                  ../auto/keywords/kws_web.robot






##########################
#        config          #
##########################
Resource                 ../config/hooks.robot
