<#-- Shared page layout. Every page calls this macro, so the head and the navigation exist in ONE place. Usage in a
  page: <#import "layout.ftlh" as l>
  <@l.page title="Home" active="home"> ...page content... </@l.page> -->
  <#macro page title active="">
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>${title} | ASOIAF Character Database</title>
      <link rel="stylesheet" href="/css/styles.css">
    </head>

    <body>
      <header class="site-header">
        <a class="brand" href="/">&#127807; ASOIAF Character Tracker</a>
        <nav>
          <a href="/" class="${(active == 'home')?then('active', '')}">Home</a>
          <a href="/about" class="${(active == 'about')?then('active', '')}">About</a>
          <a href="/characters/new" class="${(active == 'new')?then('active', '')}">Add a Character</a>
        </nav>
      </header>

      <main class="container">
        <#-- A flash message survives exactly one redirect (see RedirectAttributes in the controller). -->
          <#if message??>
            <p class="alert">${message}</p>
          </#if>
          <#nested>
      </main>
    </body>

    </html>
  </#macro>