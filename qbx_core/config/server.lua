return {
    updateInterval = 5, -- how often to update player data in minutes

    money = {
        ---@alias MoneyType 'cash' | 'bank' | 'crypto'
        ---@alias Money {cash: number, bank: number, crypto: number}
        ---@type Money
        moneyTypes = { cash = 500, bank = 5000, crypto = 0 }, -- type = startamount - Add or remove money types for your server (for ex. blackmoney = 0), remember once added it will not be removed from the database!
        dontAllowMinus = { 'cash', 'crypto', 'bank' }, -- Money that is not allowed going in minus
        paycheckTimeout = 30, -- The time in minutes that it will give the paycheck
        paycheckSociety = false -- If true paycheck will come from the society account that the player is employed at, requires qb-management
    },

    player = {
        hungerRate = 4.2, -- Rate at which hunger goes down.
        thirstRate = 3.8, -- Rate at which thirst goes down.

        ---@enum BloodType
        bloodTypes = {
            'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-',
        },

        ---@alias UniqueIdType 'citizenid' | 'AccountNumber' | 'PhoneNumber' | 'FingerId' | 'WalletId' | 'SerialNumber'
        ---@type table<UniqueIdType, {valueFunction: function}>
        identifierTypes = {
            citizenid = {
                valueFunction = function()
                    return lib.string.random('A.......')
                end,
            },
            AccountNumber = {
                valueFunction = function()
                    return 'BRL' .. math.random(1, 9) .. 'MRI' .. math.random(1111, 9999) .. math.random(1111, 9999) .. math.random(11, 99)
                end,
            },
            PhoneNumber = {
                valueFunction = function()
                    return math.random(100,999) .. math.random(1000000,9999999)
                end,
            },
            FingerId = {
                valueFunction = function()
                    return lib.string.random('...............')
                end,
            },
            WalletId = {
                valueFunction = function()
                    return 'MRI-' .. math.random(11111111, 99999999)
                end,
            },
            SerialNumber = {
                valueFunction = function()
                    return math.random(11111111, 99999999)
                end,
            },
        }
    },

    ---@alias TableName string
    ---@alias ColumnName string
    ---@type [TableName, ColumnName][]
    characterDataTables = {
        -- {'properties', 'owner'},
        {'apartments', 'citizenid'},
        {'bank_accounts_new', 'id'},
        {'playerskins', 'citizenid'},
        {'player_houses', 'citizenid'},
        {'player_mails', 'citizenid'},
        {'player_outfits', 'citizenid'},
        {'player_vehicles', 'citizenid'},
        {'player_groups', 'citizenid'},
        {'players', 'citizenid'},
        {'npwd_calls', 'identifier'},
        {'npwd_darkchat_channel_members', 'user_identifier'},
        {'npwd_marketplace_listings', 'identifier'},
        {'npwd_messages_participants', 'participant'},
        {'npwd_notes', 'identifier'},
        {'npwd_phone_contacts', 'identifier'},
        {'npwd_phone_gallery', 'identifier'},
        {'npwd_twitter_profiles', 'identifier'},
        {'npwd_match_profiles', 'identifier'},
    }, -- Rows to be deleted when the character is deleted

    server = {
        pvp = true, -- Enable or disable pvp on the server (Ability to shoot other players)
        closed = false, -- Set server closed (no one can join except people with ace permission 'qbadmin.join')
        closedReason = 'Servidor em Manutenção', -- Reason message to display when people can't join the server
        whitelist = false, -- Enable or disable whitelist on the server
        whitelistPermission = 'admin', -- Permission that's able to enter the server when the whitelist is on
        discord = '', -- Discord invite link
        checkDuplicateLicense = true, -- Check for duplicate rockstar license on join
        ---@deprecated use cfg ACE system instead
        permissions = { 'god', 'admin', 'mod' }, -- Add as many groups as you want here after creating them in your server.cfg
    },

    characters = {
        playersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
            ['license2:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'] = 2,
        },

        defaultNumberOfCharacters = 1, -- Define maximum amount of default characters (maximum 3 characters defined by default)
    },

    -- this configuration is for core events only. putting other webhooks here will have no effect
    logging = {
        webhook = {
            ['default'] = nil, -- default
            ['joinleave'] = nil, -- default
            ['ooc'] = nil, -- default
            ['anticheat'] = nil, -- default
            ['playermoney'] = nil, -- default
        },
        role = {} -- Role to tag for high priority logs. Roles use <@%roleid> and users/channels are <@userid/channelid>
    },

    giveVehicleKeys = function(src, plate, vehicle)
        return exports.mri_Qcarkeys:GiveTempKeys(src, plate)
        -- return exports.qbx_vehiclekeys:GiveKeys(src, plate)
    end,

    getSocietyAccount = function(accountName)
        -- return exports['Renewed-Banking']:getAccountMoney(accountName)
        return exports.qbx_management:GetAccount(accountName)

    end,

    removeSocietyMoney = function(accountName, payment)
        -- return exports['Renewed-Banking']:removeAccountMoney(accountName, payment)
        return exports.qbx_management:RemoveMoney(accountName, payment)

    end,
}
