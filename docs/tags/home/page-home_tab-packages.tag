<page-home_tab-packages>

    <section class="section">
        <div class="container">
            <h1 class="title">API</h1>
            <h2 class="subtitle"></h2>

            <div class="contents">
                <table class="table is-bordered is-striped is-narrow is-hoverable">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>File</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr each={obj in api}>
                            <td>{obj.name}</td>
                            <td>{obj.file}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <script>
     this.api = [
         { name: 'ghost'               , file: './core/src/package.lisp',            },
         { name: 'ghost-test'          , file: './core/t/ghost.lisp',                },
         { name: 'ghost.api'           , file: './api/src/package.lisp',             },
         { name: 'ghost.api-test'      , file: './api/tests/ghost.api.lisp',         },
         { name: 'ghost.api.render'    , file: './api/src/render.lisp',              },
         { name: 'ghost.api.route'     , file: './api/src/route.lisp',               },
         { name: 'ghost.api.utililties', file: './api/src/utililties.lisp',          },
         { name: 'ghost.controller'    , file: './api/src/controller/package.lisp',  },
         { name: 'ghost.graph'         , file: './graph/src/package.lisp',           },
         { name: 'ghost.graph-test'    , file: './graph/tests/ghost.graph.lisp',     },
     ];
    </script>

</page-home_tab-packages>
