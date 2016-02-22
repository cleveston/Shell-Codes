#!/bin/bash

export http_proxy="http://avast:avast2008@proxy:3128"

curl -d "form_resposta="$1"&id_pergunta=1&acao=votar" http://www.trackmusic.com.br/enquete/enquete.php?acao=votar

