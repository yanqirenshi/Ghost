<page-home_tab-classes>

    <section class="section">
        <div class="container">
            <h1 class="title">Classes</h1>
            <h2 class="subtitle"></h2>

            <div class="contents">
                <table class="table is-bordered is-striped is-narrow is-hoverable">
                    <thead>
                        <tr>
                            <th>Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr each={obj in classes}>
                            <td>{obj.name}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <script>
     this.classes = [
         { name: 'existence' },
         { name: 'buddha-nature' },
         { name: 'naming' },
         { name: 'cyber-space' },
         { name: '84key' },
         { name: 'deccot' },
         { name: 'email' },
         { name: 'google' },
         { name: 'facebook' },
         { name: 'twitter' },
         { name: 'ghost' },
         { name: 'oauth-provider' },
         { name: 'edge' },
     ];
    </script>

</page-home_tab-classes>
