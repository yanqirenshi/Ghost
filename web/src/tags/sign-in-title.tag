<sign-in-title>
    <section class="section" style="padding-bottom: 0px; margin-top: 33px;">
        <div class="container">
            <h1 class="title is-1"
                style="font-family:{fontFamily()}, cursive;">Ghost</h1>
        </div>
    </section>

    <script>
     this.fonts = [ 'Pacifico',
                    'Dancing Script',
                    'Shadows Into Light',
                    'Mountains of Christmas',
                    'Amatic SC',
                    'Kaushan Script',
                    'Satisfy',
                    'Great Vibes',
                    'Caveat',
                    'Sacramento',
                    'Bad Script',
                    'Rock Salt',
                    'Yellowtail',
                    'Cabin Sketch',
                    'Parisienne',
                    'Nothing You Could Do',
                    'Srisakdi',
                    'Allura',
                    'Reenie Beanie'];

     this.fontFamily = () => {
         let len = this.fonts.length;
         let i = Math.round( Math.random() * len );
         return this.fonts[i];
     };
    </script>

    <style>
     sign-in-title > .section > .container > .title {
         text-align: center;
         font-size: 222px;
         text-shadow: 0px 0px 22px #333;
     }
    </style>
</sign-in-title>
