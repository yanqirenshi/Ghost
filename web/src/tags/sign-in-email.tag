<sign-in-email>
    <section class="section" style="padding-top:11px;">
        <div class="container">
            <div class="card ghost-box-shadow">

                <header class="card-header">
                    <p class="card-header-title">
                        Sign In
                    </p>
                </header>

                <div class="card-content">
                    <input class="input"
                           type="text"
                           placeholder="Email"
                           style="margin-bottom: 22px;">

                    <input class="input"
                           type="text"
                           placeholder="Password">

                    <div style="margin-top:22px;">
                        <button class="button is-warning"
                                style="width:100%;">Sign In</button>
                    </div>
                </div>
            </div>
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
     sign-in-email .card {
         width: 333px;
         margin-left: auto;
         margin-right: auto;
         border-radius: 8px 8px 0px 0px;
     }
    </style>
</sign-in-email>
