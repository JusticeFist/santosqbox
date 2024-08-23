const { ref } = Vue

// Customize language for dialog menus and carousels here

const load = Vue.createApp({
  setup () {
    return {
        CarouselText1: 'Você pode adicionar/remover itens, veículos, empregos e gangues através da pasta compartilhada.',
        CarouselSubText1: 'Foto capturada por: Markyoo#8068',
        CarouselText2: 'Encontrou algum problema ou quer sugerir pedidos de funcionalidades? Acesse nosso GitHub e crie um problema!',
        CarouselSubText2: 'Foto capturada por: ihyajb#9723',
        CarouselText3: 'Todos os ajustes específicos do servidor podem ser feitos nos arquivos config.lua em todo o build.',
        CarouselSubText3: 'Foto capturada por: FLAPZ[INACTIV]#9925',
        CarouselText4: 'Para suporte adicional, por favor, junte-se à nossa comunidade em discord.gg/qbox',
        CarouselSubText4: 'Foto capturada por: Robinerino#1312',

        DownloadTitle: 'Baixando o Servidor mri_Qbox',
        DownloadDesc: "Aguarde enquanto começamos a baixar todos os recursos/necessários para jogar no Servidor mri_Qbox. \n\nApós o download ser concluído com sucesso, você será colocado no servidor e esta tela desaparecerá. Por favor, não saia ou desligue seu PC. ",

        SettingsTitle: 'Configurações',
        AudioTrackDesc1: 'Quando desativado, a faixa de áudio atual será interrompida.',
        AutoPlayDesc2: 'Quando desativado, as imagens do carrossel pararão de girar e permanecerão na última mostrada.',
        PlayVideoDesc3: 'Quando desativado, o vídeo será pausado e permanecerá assim.',

        KeybindTitle: 'Atalhos Padrão',
        Keybind1: 'Abrir Inventário',
        Keybind2: 'Ciclo de Proximidade',
        Keybind3: 'Abrir Celular',
        Keybind4: 'Alternar Cinto de Segurança',
        Keybind5: 'Abrir Menu de Alvo',
        Keybind6: 'Menu Radial',
        Keybind7: 'Abrir Menu Hud',
        Keybind8: 'Falar no Rádio',
        Keybind9: 'Abrir Placar',
        Keybind10: 'Travas do Veículo',
        Keybind11: 'Alternar Motor',
        Keybind12: 'Emote de Apontar',
        Keybind13: 'Slots de Atalhos',
        Keybind14: 'Emote de Mãos para Cima',
        Keybind15: 'Usar Slots de Item',
        Keybind16: 'Controle de Cruzeiro',

      firstap: ref(true),
      secondap: ref(true),
      thirdap: ref(true),
      firstslide: ref(1),
      secondslide: ref('1'),
      thirdslide: ref('5'),
      audioplay: ref(true),
      playvideo: ref(true),
      download: ref(true),
      settings: ref(false),
    }
  }
})

load.use(Quasar, { config: {} })
load.mount('#loading-main')

$(document).ready(function () {
    var audioFiles = [
        'assets/audio/ambientgold.mp3',
        'assets/audio/chimes.mp3',
        'assets/audio/daze.mp3',
        'assets/audio/galaxy.mp3',
        'assets/audio/highwaynights.mp3',
        'assets/audio/meteorbinge.mp3'
    ];

    var randomSong = audioFiles[Math.floor(Math.random() * audioFiles.length)];

    $('#audio').attr('src', randomSong);

    $('#audio')[0].autoplay = true;

    $('#audio')[0].play();
});

var audio = document.getElementById("audio");
audio.volume = 0.05;

function audiotoggle() {
    var audio = document.getElementById("audio");
    if (audio.paused) {
        audio.play();
    } else {
        audio.pause();
    }
}

function videotoggle() {
    var video = document.getElementById("video");
    if (video.paused) {
        video.play();
    } else {
        video.pause();
    }
}

const handlers = {
    loadProgress({ loadFraction }) {
        document.querySelector(".thingy").style.width = loadFraction * 100 + "%";
    },
};

window.addEventListener("message", function (e) {
    (handlers[e.data.eventName] || function () {})(e.data);
});
