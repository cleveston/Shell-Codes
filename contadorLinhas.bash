#!/bin/bash 
num=0 
linhas=0
palavras=0
caracteres=0
for arq in `find /var/www/tahky/protected/ -name *.php`; do
linha=`wc -l $arq | awk '{print $1}'`
palavra=`wc -w $arq | awk '{print $1}'`
caractere=`wc -c $arq | awk '{print $1}'`
linhas=`expr $linhas + $linha`
palavras=`expr $palavras + $palavra`
caracteres=`expr $caracteres + $caractere`
done
echo PHP
echo Linhas: $linhas
echo Palavras: $palavras
echo Caracteres: $caracteres
