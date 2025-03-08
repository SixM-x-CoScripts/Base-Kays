let audio = new Audio();
let randomSong = Math.floor(Math.random() * 14); // Nombre de musiques dans musicList

function Main() {
    return {
        DiscordGuildId: '1297265474937159721', // Also known as Discord server ID
        DiscordInviteLink: "https://discord.gg/V9YdK339MY",
        BoutiqueInviteLink: "https://kays.mysellauth.com/#products",
        TiktokInviteLink: "https://www.tiktok.com/@kay_sww",
        memberCount: 1500,
        musicAutoplay: true, // Set this to true if you want the music to autoplay
        musicVolume: 0.1, // Set the volume that you like (0 = 0% ; 0.5 = 50% ; 1 = 100%)
        buttons: [
            { label: 'Accueil', selected: true },
            { label: 'Nouveautés', selected: false },
        ],
        musicList: [
            { label: 'Je m\'appelle', author: 'Benzz', src: 'audio/song1.mp3' },
            { label: 'Tu connais', author: 'Werenoi', src: 'audio/song2.mp3' },
            { label: 'Sprinter', author: 'Central Cee ft. Dave', src: 'audio/song4.mp3' },
            { label: 'Mauvaise', author: 'Werenoi', src: 'audio/song6.mp3' },
            { label: 'Témoin', author: 'Werenoi', src: 'audio/song8.mp3' },
            { label: 'PARANO', author: 'ZOLA ft. Koba LaD', src: 'audio/song9.mp3' },
            { label: 'Je suis en moto', author: 'Werenoi', src: 'audio/song10.mp3' },
            { label: 'Casanova', author: 'Soolking ft. Gazo', src: 'audio/song11.mp3' },
            { label: 'Mélanine', author: 'Heuss l\'enfoiré ft. Werenoi', src: 'audio/song12.mp3' },
            { label: 'HAKAYET', author: 'VEN1', src: 'audio/song13.mp3' },
            { label: 'Dans un verre', author: 'Werenoi ft. SDM', src: 'audio/song14.mp3' },
            { label: 'Encré', author: 'Emma\'a', src: 'audio/song16.mp3' },
            { label: 'NIYA', author: 'MANAL', src: 'audio/song17.mp3' },
            { label: 'J\'en ai marre', author: 'KOUZ1 ft. Tagne', src: 'audio/song18.mp3' },
            { label: 'VANILLA ', author: 'VEN1 ft. RAMOS', src: 'audio/song19.mp3' },
            { label: 'Ainsi Bas La Vida', author: 'Indila', src: 'audio/song20.mp3' },
            { label: 'greedy', author: 'Tate McRae', src: 'audio/song21.mp3' },
            { label: 'Sois pas timide', author: 'GIMS', src: 'audio/song22.mp3'},
            { label: 'Sbart ou tal adabi', author: 'Cheb Hasni', src: 'audio/song23.mp3'},

        ],
        // No touching here!!!!
        isMusicPlaying: false,
        musicOpen: true,
        currentSong: 0,
        listen() {
            if (this.musicAutoplay) {
                this.currentSong = randomSong;
                this.play();
            }
        },
             
        selectBtn(select) {
            this.buttons.forEach(function (button) {
                button.selected = false;
            });
            return true;
        },
        play() {
            audio.src = this.musicList[this.currentSong].src;
            audio.load();
            audio.play();
            audio.volume = this.musicVolume;
            this.isMusicPlaying = true;
        },
        pause() {
            audio.pause();
            this.isMusicPlaying = false;
        },
        next() {
            if (this.isMusicPlaying) {
                audio.pause();
            }
            if (this.currentSong < this.musicList.length - 1) {
                this.currentSong++;
            } else {
                this.currentSong = 0;
            }
            audio.src = this.musicList[this.currentSong].src;
            audio.load();
            audio.play();
            this.isMusicPlaying = true;
        },
        prev() {
            if (this.isMusicPlaying) {
                audio.pause();
            }
            if (this.currentSong != 0) {
                this.currentSong = this.currentSong - 1;
            } else {
                this.currentSong = this.musicList.length - 1;
            }
            audio.src = this.musicList[this.currentSong].src;
            audio.load();
            audio.play();
            this.isMusicPlaying = true;
        },
    }
}

document.addEventListener('DOMContentLoaded', function () {
    const volumeSlider = document.getElementById('volume-slider');
    const main = Main();

    volumeSlider.addEventListener('input', function () {
        audio.volume = volumeSlider.value;
        main.musicVolume = volumeSlider.value; // Update the musicVolume property
    });

    main.listen(); // Start listening for autoplay if enabled
});

document.querySelector('.btn').addEventListener('mousedown', function () {
    this.style.transform = 'translateY(1px)';
});

document.querySelector('.btn').addEventListener('mouseup', function () {
    this.style.transform = 'translateY(0)';
});

document.querySelector('.button').addEventListener('click', function () {
    this.classList.toggle('selected');
});

function show1() {
    $(".containers0").fadeIn(500);
    $(".containers1").hide();
    $(".containers2").hide();
}

function show2() {
    $(".containers0").hide();
    $(".containers1").fadeIn(500);
    $(".containers2").hide();
}

function show3() {
    $(".containers0").hide();
    $(".containers1").hide();
    $(".containers2").fadeIn(500);
}

window.addEventListener('message', function (e) {
    switch (e.data.eventName) {
        case 'loadProgress':
            document.querySelector('.loadingbar-loaded').style.width = (e.data.loadFraction * 100) + '%';
            break;
        case 'onLogLine':
            document.querySelector('.loadingbar-loaded').style.width = '100%';
            break;
    }
});