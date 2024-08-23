local Translations = {
    error = {
        toofast = "Você não pode ir tão rápido",
        nocheckpoints = "Você não colocou nenhum ponto de verificação ainda..",
        atleast10checkp = "Você deve ter pelo menos 10 pontos de verificação",
        higherthan15 = "Você não pode ir mais alto que 15",
        lowerthan2 = "Você não pode ir mais baixo que 2",
        mustbeinveh = "Você deve estar em um veículo",
        pressagain = "Pressione [9] novamente para confirmar",
        editorcancelled = "Editor de corrida cancelado!",
        alreadymaking = "Você já está criando uma corrida.",
        alreadyinrace = "Você já está em uma corrida..",
        notinarace = "Você não está em uma corrida..",
        playerfinished = "%{firstname} terminou: %{spot}º",
        gobackorkick = "Volte para o início ou você será expulso da corrida: %{seconds}s",
        namealreadyused = "Já existe uma corrida com este nome.",
        notauthorized = "Você não foi autorizado a %{to}.",
        raceended = "Você foi o único na corrida, a corrida acabou",
        alreadyrunning = "A corrida já está em andamento",
        notexist = "Esta corrida não existe :(",
        stoppingrace = "Parando a corrida: %{RaceId}",
        racenotopen = "Corrida não aberta: %{RaceId}",
        notcreator = "Você não é o criador da corrida..",
        notstarted = "Esta corrida ainda não começou.",
        nomoreraces = "Não é possível criar mais corridas!",
    },
    success = {
        savedrace = "Corrida: %{racename} está salva!",
        finishedbest = "Corrida terminada em %{time}, com a melhor volta: %{best}",
        finished = "Corrida terminada em: %{time}",
        start = "VAI!",
        cancreate = "As corridas podem ser criadas novamente!",
    },
    primary = {
        LeaveRace = "Você completou a corrida!",
        startinten = "A corrida começará em 10 segundos",
    },
    general = {
        CheckL = "Verificação Esquerda",
        CheckR = "Verificação Direita",
        DNF = "DNF",
        unknown = "Desconhecido",
        dothis = "faça isso",
        createraces = "criar corridas"
    },
    phonenotif = {
        wonWR = "Você ganhou o WR de %{Racename} desconectado com um tempo de: %{timeof}!",
        wonWR2 = "Você ganhou o WR de %{Racename} estabelecido com um tempo de: %{timeof}!",
        joinedrace = "%{firstname}. %{lastname} a corrida foi ingressada!",
        LeaveRace = "%{firstname}. %{lastname} a corrida foi entregue!",
    },
    commands = {
        cancelrace = "Cancelar corrida em andamento..",
        togglesetup = "Ativar/Desativar configuração de corrida"
    }
}

if GetConvar('qb_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end