
> Importante!
> Você precisa permitir a execução dos arquivos para que eles funcionem.
> Leia as "Dúvidas" abaixo.

## Home Customization
Programa para mudar a interface do computador da escola.  

Eu escrevi somente os programas em BASH. Os temas, ícones, papéis de parede, etc., não são meus.  

Home Customization ainda está em desenvolvimento.  

## Como funciona?
Todos os parâmetros da customização -- ícones, cursor, papel de parede... -- estão salvos no arquivo _config.sh_.  

Para aplicar a customização ao Cinnamon, simplesmente execute o arquivo _aplicar.sh_, o qual lê o que está definido no _config.sh_.  

Você pode editar diretamente o arquivo _config.sh_ para que ele se lembre da sua configuração ou rodar o arquivo _gerarConfig.sh_ pelo terminal para uma experiência interativa.

## Dúvidas?
#### Como que eu executo um arquivo .sh?  
Basta dar um clique duplo e apertar no botão "Executar". Se quiser abrir o terminal junto, aperta em "Executar no terminal".  
![Clique duplo, depois "executar"](.git/image/run.png)


#### Os arquivos não querem abrir. O que eu faço?  
O Linux está restringindo eles. Você precisa conceder aos arquivos a permissão de execução.  
1. Dentro da pasta home-customization, dê um clique direto em qualquer lugar.
2. Clique em "Abrir no terminal".
3. No terminal, digite "chmod --recursive +x .".  
![Abrir no terminal](.git/image/chmod1.png)  
![Alterar permissão](.git/image/chmod2.png)  

## Créditos
Software disponível nesse repositório. Nenhum foi modificado.

Extensão:  
https://github.com/klangman/BlurCinnamon - licença GPL-3.0  
https://github.com/fabiodamio/active-window-indicator - sem licença?  
https://github.com/hermes83/compiz-windows-effect - licença GPL-3.0  
https://github.com/linuxmint/cinnamon-spices-extensions/tree/master/dim-inactive-windows@jark - licença GPL-2.0  
https://github.com/linuxmint/cinnamon-spices-extensions/tree/master/mouse-shake-zoom@rcalixte - licença GPL-2.0  
https://github.com/germanfr/watermark-cinnamon - licença LGPL-3.0  
  
Tema:  
https://github.com/smurphos/adapta-gtk-theme-cinnamon-spices - licença GPL-2.0  
https://github.com/daniruiz/skeuos-gtk - licença GPL-3.0  

Pacote de ícones:  
https://github.com/L4ki/Breeze-Chameleon-Icons - licença GPL-3.0  

Cursor:
https://github.com/ful1e5/Bibata_Cursor - licença GPL-3.0
