---@diagnostic disable: undefined-global
local scss_template = [[
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- use this command in the terminal -->
        <!--sass --no-source-map --watch scss:css-->

        <!-- title -->
        <title>${1:title}</title>

        <!-- description -->
        <meta name="description" content="${2:desc}" />

        <!-- icon -->
        <link rel="shortcut icon" type="image/ico" href="${3:path}" />

        <!-- stylesheet -->
        <link rel="stylesheet" href="${4:path2}" />

        <!-- js -->
        <script type="text/javascript" src="${5:location}"></script>
    </head>

    <body>
      $0
    </body>
</html>
]]

local css_template = [[
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- title -->
        <title>$1</title>

        <!-- description -->
        <meta name="description" content="$2" />

        <!-- icon -->
        <link rel="shortcut icon" type="image/ico" href="$3" />

        <!-- stylesheet -->
        <link rel="stylesheet" href="$4" />

        <!-- js -->
        <script type="text/javascript" src="$5"></script>
    </head>

    <body>
      $0
    </body>
</html>
]]

return {
    parse({ trig = "scss" }, scss_template),
    parse({ trig = "css" }, css_template),
}
