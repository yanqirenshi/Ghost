<sign-in-title>
    <section class="section" style="padding-bottom: 0px; margin-top: 33px;">
        <div class="container">
            <h1 class="title is-1"
                style={title_style()}>{title()}</h1>
        </div>
    </section>

    <script>
     this.title_style = () => {
         let font = this.fontFamily();

         return 'font-family:'+ font.code + ', cursive;' +
                'font-size:' + font.size + ';'
     };

     this.fontFamily = () => {
         let fonts = _GHOST_CONFIG.title.fonts;
         let len = fonts.length;
         let i = Math.round( Math.random() * len );

         return fonts[i];
     };
    </script>

    <script>
     this.title = () => {
         console.log(_GHOST_CONFIG.title);
         let title = _GHOST_CONFIG.title.contents;
         return title ? title : '????????'
     }
    </script>

    <style>
     sign-in-title > .section > .container > .title {
         text-align: center;
         font-size: 222px;
         text-shadow: 0px 0px 22px #333;
     }
    </style>
</sign-in-title>
