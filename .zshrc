#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
# _ / /_ ___) |  _  |  _ <| |___ 
#(_)____|____/|_| |_|_| \_\\____|
#
#############################################################################################################
#.zshrc - Arquivo de inicialização do Z shell                                                               # 
#Criado por: Thiago Silva                                                                                   #
#Email :thiagors1983@gmail.com                                                                              #
#Baseado na configuração usada pelo Sandro Marcel  (https://www.vivaolinux.com.br/etc/.zshrc-SMarcell)      # 
#Linux  é o poder                                                                                           # 
#Antes de usar vejam com atenção toda a configuração e satisfaçam as dependencias para o pleno funcionamento#
#Os aliases usado nessa configuração são exclusivos do Arch e derivados.                                    #
#############################################################################################################

# text normal colors
red='\e[0;31m'
blue='\e[0;34m'
cyan='\e[0;36m'
green='\e[0;32m'
yellow='\e[0;33m'

# text bright colors
bred='\e[0;91m'
bblue='\e[0;94m'
bcyan='\e[0;96m'
bgreen='\e[0;92m'
byellow='\e[0;93m'
bwhite='\e[0;97m'

# reset color
NC='\e[0m'

  echo -ne "${cyan}";figlet "Arch Linux";
  echo -ne "${red}Today is:\t\t${cyan}" `date`; echo ""

# Variaveis: 
  export BROWSER="firefox"
  export EDITOR="vim"

# Zsh-syntax-highlighting 
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  #Syntax-highlighting semelhante ao do shell Fish é  necessário instalar o pacote  zsh-syntax-highlighting 

# pkgfile  inclui um gancho para "command-not-found"  que irá procurar automaticamente nos repositórios oficiais, ao entrar em um comando não reconhecido.È necessário instalar o pacote  pkgfile
  source /usr/share/doc/pkgfile/command-not-found.zsh

# Histórico:
   export HISTFILE=${HOME}/.zsh_history
   export HISTSIZE=5000
   export SAVEHIST=$HISTSIZE 

# Evitando duplicatas no histórico 
 setopt HIST_IGNORE_ALL_DUPS
 
# Opções para o histórico:
 setopt EXTENDED_HISTORY HIST_VERIFY HIST_REDUCE_BLANKS HIST_IGNORE_ALL_DUPS
    # Obs.: Caso queira procurar um comando específico no histórico,
    # você pode utilizar como alternativa a combinação de teclas
    # 'CTRL+R' e digitar o comando procurado.

# Carregando alguns módulos úteis:
    zmodload -i zsh/complete
    zmodload -i zsh/mapfile
    zmodload -i zsh/mathfunc
    zmodload -i zsh/complist
    zmodload -i zsh/curses
    zmodload -i zsh/datetime
    zmodload -i zsh/terminfo 

# Carregando o módulo zmv
    autoload -U zmv 

 # Ativando auto-correção:
    setopt correct
    setopt correct_all
    export sprompt="$(print '%{\e[37m%}zsh: Corrigir para %S%r%s ? (n|y|e): %{\e[0m%}')"
 
 # Permite o uso dos curingas: *?_-.[]~=/&;!#$%^(){}<>
    setopt extended_glob

 # Ativando auto cd (não há necessidade de uso do comando cd):
    setopt auto_cd
    setopt cdable_vars
    setopt auto_pushd
    setopt pushd_ignore_dups
    setopt pushd_silent
 
 # Auto-completando com <TAB>
    setopt auto_list
    setopt auto_menu
    setopt case_glob
    setopt list_types
    setopt glob_complete
    setopt menu_complete
    setopt complete_in_word
    setopt complete_aliases
    autoload -Uz compinit promptinit
    compinit
    promptinit
    autoload  colors                       
    colors
    prompt fade  #prompt -l com esse comando vc terá mais opções do prompt troquem Adam2 por qualquer uma das disponíveis
  #  RPROMPT="%{$reset_color%}< %{$fg[blue]%}%M%{$reset_color%}:%{$fg[cyan]%}%y%{$reset_color%}:%{$fg[yellow]%}%~%{$reset_color%}"
  #  PROMPT="%{$reset_color%}%{$fg[yellow]%} %T%{$reset_color%} %{$fg[green]%}%n%{$reset_color%} > "

 # Teclas del e ctrl+r funcionando normalmente.
   bindkey -v
   bindkey '\e[3~' delete-char
   bindkey '^R' history-incremental-search-backward

# Limpando a tela do terminal usando a tecla <ESC>:
  bindkey '^[' clear-screen

 # Ativando modo 'verbose':
   zstyle ':completion:*' verbose 'yes'
   zstyle ':completion:*' show-completer

 # Lista colorida de complementações:
   zstyle ':completion:*:default' list-colors ${(s.:.)ZLS_COLORS}

 # Menu de seleção visual:
   zstyle ':completion:*' menu select=3 _complete _i-patterns ignored_approximate
   zstyle ':completion:*' select-prompt '%S zsh: Seleção atual = %p %s'

 # Auto descrição das complementações possíveis:
   zstyle ':completion:*:options' description 'yes'
   zstyle ':completion:*:options' auto-description '%d'

 # Formato das mensagens de auto-complementação:
   zstyle ':completion:*:corrections' format '%Bzsh: %d (erros: %e)%b'
   zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
   zstyle ':completion:*:warnings' format '%Bzsh: Inválido como: %d%b'

 # Listando auto-complementações em grupos:
   zstyle ':completion:*:matches' groups 'yes'
   zstyle ':completion:*' list-grouped
   zstyle ':completion:*' group-name ''
   zstyle ':completion:*:*:-command-:*' group-order commands builtins

 # Expandir o máximo que puder:
   zstyle ':completion:incremental:*' completer _complete _correct
   zstyle ':completion:*' completer _complete _correct _match _approximate
   zstyle ':completion:*:expand:*' tag-order all-expansions

 # Número de erros a aceitar durante auto-complementação:
   zstyle ':completion:*:approximate:*' max-errors 2 numeric

 # Usar '/d/s <TAB>' para expandir para '/dir/subdir':
   zstyle ':completion:*' expand 'yes'
   zstyle ':completion:*' squeeze-slashes 'yes'

 # Preservar prefixo/sufixo durante auto-complementação:
  zstyle ':completion:*' expand prefix suffix
  zstyle ':completion:*' completer _complete _prefix _match _approximate
  zstyle ':completion:*' preserve-prefix '//[^ /]##/'
  zstyle ':completion:*:match:*' original only 
  zstyle ':completion:*approximate :*' max-errors 1 numeric

 # Opção auto-cd deve ignorar o diretório corrente:
   zstyle ':completion:*:cd:*' ignore-parents parent pwd

 # Evitar entradas duplicadas para os comandos abaixo:
   zstyle ':completion:*:rm:*' ignore-line 'yes'
   zstyle ':completion:*:cp:*' ignore-line 'yes'
   zstyle ':completion:*:mv:*' ignore-line 'yes'

 # Auto-complementação case-sensitive:
   zstyle ':completion:*:complete:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

 # Auto-complementar a partir de curingas:
   zstyle ':completion:*:complete-extended:*' matcher 'r:|[.,_-]=* r:|=*'

 # Ignorar auto-complementação de funções internas do zsh:
   zstyle ':completion:*:functions' ignored-patterns '_*'
 
# Auto-completar para o comando 'kill':
   zstyle ':completion:*:processes' command 'ps x -o pid,command'
   zstyle ':completion:*:kill:*' menu yes select
   zstyle ':completion:*:kill:*' force-list always
   zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#Comando help dentro  do Zsh
  autoload -U run-help
  autoload run-help-git
  autoload run-help-svn
  autoload run-help-svk
  unalias run-help

# Sintaxe colorida # wget https://raw.githubusercontent.com/trapd00r/LS_COLORS/master/LS_COLORS -O ~/.dircolors
  eval $(dircolors -b $HOME/.dircolors)
  alias ls="ls -F -h --color=auto"

#####################################################################################################################
## Funções
#####################################################################################################################
#
#myip - Encontra o ip externo quando conectado a internet
function meuip ()
{
lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{
print $4}' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'
 }

# Man pages coloridas: #pacman -S most 
 if [ -e $(which most) ]
 then
    export PAGER='most -s'
    export LESSHISTFILE='-'
 else
    export PAGER=less
 fi

 #Colorindo a saida de vários programa.#pacman -S grc   
GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n "$GRC" ]
then
    alias colourify="$GRC -es --colour=auto"
    alias cfg='colourify ./configure'
    alias configure='colourify ./configure'
    alias diff='colourify diff'
    alias make='colourify make'
    alias gcc='colourify gcc'
    alias g++='colourify g++'
    alias as='colourify as'
    alias gas='colourify gas'
    alias ld='colourify ld'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias traceroute='colourify /usr/sbin/traceroute'
    alias head='colourify head'
    alias tail='colourify tail'
    alias dig='colourify dig'
    alias mount='colourify mount'
    alias ps='colourify ps'
    alias mtr='colourify mtr'
    alias df='colourify df'
fi

# Calcula a  memória realmente utilizada (desconsiderando o cache)
function  mem(){
 echo "`free|grep Mem|awk '{printf(\"%.0f\",($3-($6+$7))/1000)}'` MiB";
}

#listar os erros contidos nos logs do ultimo boot do sistema
function logerr(){ journalctl -b -p err}

#Mostrar apenas os processos do  usuario.
function  psuser() { 
 ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ;
}

function imgur-upl() { # Upload de  imagens para o o imgur
        curl -s -F image=@"$1" -F "key=1913b4ac473c692372d108209958fd15" \
        http://api.imgur.com/2/upload.xml | grep -Eo "<original>(.)*</original>" \
        | grep -Eo "http://i.imgur.com/[^<]*"
}

#hastebin
function haste() { # Upload de arquivos para o hastebin,este tem suporte a syntax highlight.
a=$(cat); curl -X POST -s -d "$a" http://hastebin.com/documents | awk -F '"' '{print "http://hastebin.com/"$4}';
}

zls () { #Similar ao comando ls 
  zmodload zsh/stat
  local -a st
  local name dev inode mode nlink uid gid rdev
  local size atmim mtime ctme blksize blocks link
  [[ $# -eq 0 ]] && set -- *
  zstat -nsLA st "$@"
  for name dev inode mode nlink uid gid rdev size atmim mtime ctme blksize blocks link in "$st[@]"
  do print -r -- "$mode $nlink ${(r:8:)uid} ${(r:8:)gid} ${(l:9:)size} $name"
  done
}

function calendario() { cal "$@" $(date +%Y)}

function gerarsenhas()
{
        perl <<EOPERL
        my @a = ("a".."z","A".."Z","0".."9",(split //, q{#@,.<>$%&()*^}));
        for (1..10) { 
                print join "", map { \$a[rand @a] } (1..rand(3)+7);
                print qq{\n} 
        }
EOPERL
}

function start() { sudo systemctl start $@ ; }
function stop()  { sudo systemctl stop $@ ;  }
function restart() { sudo systemctl restart $@ ; }
function status()  { sudo systemctl status $@ ; }
#function ativar()  { sudo systemctl enable $@ ; }
function disable() { sudo systemctl disable $@ ; }

function extrair()      
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *.xz)        unxz $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Comprimir
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }
mktxz() { tar cvJf "${1%%/}.tar.xz" "${1%%/}/"; }

# informações ----------------------------------------------------------------
#function space() { du -skh * | sort -hr ; }
# Uso do HD
#function dduse() { echo -e " `df | grep sda1 | awk '{print $5}'` used -- `df | grep sda1 | awk '{print $6}'` free"; }
# Uso de memória
#function mmuse() { echo -e " `free -mh | awk '/^Mem/ {print $3}'` used -- `free -mh  | awk '/^Mem/ {print $4}'` free"; }
# Velocidade das fans 
#function fans() { echo -e " fan1: `sensors | grep 'RPM' | grep fan1 | cut -c 14-22` -- fan2: `sensors | grep 'RPM' | grep fan2 | cut -c 14-22`"; }
# Temperatura
#function temps() { echo -e " cpu: `cat /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp2_input | cut -c-2`°C -- hdd: +`hddtemp /dev/sda | awk '{print $4}'`"; }

# hardware -------------------------------------------------------------
# processador
#function core() { cat /proc/cpuinfo | grep 'model name' | sed -e 's/model name.*: //'| uniq | cut -c 10,11,12,13,18,19,20,21,22,23,24,32,33,34,35,36  ; }
# Placa de Vídeo
#function graph() { lspci | grep -i vga | cut -c 35-41,60-73,84  ; }
# Placa de rede 
#function ethcard() { lspci | grep -i ethernet | cut -c 30-69 ; }

# infobox --------------------------------------------------------------
#function ii()
#{
#    echo#
#    echo -e "${red}                                                           ┌─────────────────────────┐"
#    echo -e "${red}┌──────────────────────────────────────────────────────────┤$NC        Arch InfoBox    ${red} │"
#    echo -e "${red}│          ┌──────────────────┐                            └────────────┬────────────┘"
#    echo -e "${red}├──────────┤${bblue} Linux é o poder ${red} ├─────────────────────────────────────────┘"
#    echo -e "${red}│          └──────────────────┘"
#    echo -e "${red}│${blue}┌── agenda ────────────────────────────────────────────────────────────"
#    echo -e "${red}│${blue}└$NC `date +'%A, %B %-d, %Y -- %I:%M %P'`"
#    echo -e "${red}│${bblue}┌── processor information ─────────────────────────────────────────────"
#    echo -e "${red}│${bblue}└$NC `core`"
#    echo -e "${red}│${bblue}┌── graphic information ───────────────────────────────────────────────"
#    echo -e "${red}│${bblue}└$NC`graph`"
#    echo -e "${red}│${bblue}┌── ethernet information ──────────────────────────────────────────────"
#    echo -e "${red}│${bblue}└$NC`ethcard`"
#    echo -e "${red}│          ┌────────────────────────────┐"
#    echo -e "${red}├──────────┤${bgreen}      Arch       Linux     ${red} │"
#    echo -e "${red}│          └────────────────────────────┘"
#    echo -e "${red}│${yellow}┌── kernel information ────────────────────────────────────────────────"
#    echo -e "${red}│${yellow}└$NC `uname -r`"
#    echo -e "${red}│${bcyan}┌── machine stats ─────────────────────────────────────────────────────"
#    echo -e "${red}│${bcyan}└$NC`uptime`"
#    echo -e "${red}│${bgreen}┌── memory stats ──────────────────────────────────────────────────────"
#    echo -e "${red}│${bgreen}└$NC`mmuse`"
#    echo -e "${red}│${green}┌── disk stats ────────────────────────────────────────────────────────"
#    echo -e "${red}│${green}└$NC`dduse`"
#    echo -e "${red}│${blue}┌──  fan stats ────────────────────────────────────────────────────────"
#    echo -e "${red}│${blue}└$NC`fans`"
#    echo -e "${red}│${yellow}┌── sensors ───────────────────────────────────────────────────────────"
#    echo -e "${red}│${yellow}└$NC`temps`"
#   echo -e "${red}│          ┌──────────────────┐"
#   echo -e "${red}├──────────┤${bcyan} Open Connections${red} │"
#   echo -e "${red}│          └──────────────────┘"
#   echo -e "${red}│$NC `oports`"
#    echo -e "${red}└────────────────────────────────────────────────────────────────────┤│"
    
#}


# Encontrar arquivo no diretória atual
function ff() { find . -type f -iname '*'$*'*' -ls ; }

function zumbis() {
  ps f -eo state,pid,ppid,comm | awk '
    { cmds[$2] = $NF }
    /^Z/ { print $(NF-1) "/" $2 " zombie child of " cmds[$3] "/" $3 }'
}

# Powerfonts
if [[ -r /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
fi

#Aliases - Atalhos para comandos
 alias ls='ls -CFb'
 alias la='ls -LaFb'
 alias ll='ls -lFb' 
 alias dc='dcfldd'

#Aliases diversos
 alias saidar='saidar -c'  # pacman -S libstatgrab pystatgrab; 
 #alias df='dfc -dTls' #pacman -S dfc 
 alias cp='vcp -gR' #cp avançado com suporte a barra de progresso,calculo de porcentagem e controle de dados.
 alias ping='gping'

#Aliases  pacman
 alias pacsearch="pacman -Sl | cut -d' ' -f2 | grep " #Permite pesquisar todos os pacotes disponíveis simplesmente usando 'pacsearch packagename':
 alias pkglist="comm -13 <(pacman -Qmq | sort) <(pacman -Qqe | sort) > pkglist" # Cria  lista de todos os pacotes instalados 
 alias pacupg='sudo pacman -Syu' #Sincroniza os repositórios e  atualiza caso tiver alguma atualização
 alias pacrem='sudo pacman -Rns' #Remove um pacote especifico e todas as suas dependencias e configurações
 alias pacre='sudo pacman -R' #Remove um pacote esṕecifico,mas não remove  as suas dependencias e configurações
 alias pacorf='sudo pacman -Rns $(pacman -Qtdq)' #Cria  lista de pacotes orfãos para remoção 
 alias pacin='sudo pacman -S' #Instala um pacote especifico

#Aliases  yaourt 
 alias yaupg='yaourt -Syua' #Sincroniza os repositórios e  atualiza caso tiver alguma atualização pelo aur 
 alias yain='yaourt -S' #Instala uma pacote especifico 
 alias yarem='yaourt -Rns' #Remove um pacote especifico e todas as suas dependencias e configurações
 alias yare='yaourt -R'  #Remove um pacote esṕecifico,mas não remove  as suas dependencias e configurações

#Erros típicos
 alias cd..='cd ..'
 alias ...='cd ..'
 alias ....='cd ../..'

#Que a força esteja com vc 
 alias starwars="telnet towel.blinkenlights.nl"

#Agenda
 alias agenda='calcurse'

#lista os 10 ultimos comandos executados no shell
 alias top10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

#Processos usados pela Web
 alias ports='lsof -i -n -P'

#Colorindo o comando cat  # pacman  -S lolcat 
  alias cat='lolcat'

#Comando help dentro  do Zsh
  alias help='run-help'

# Screenfetch colorido
  alias sf='screenfetch | lolcat'




