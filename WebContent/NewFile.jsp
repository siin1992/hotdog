<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>3D Buttons</title>
<style>

body {
  font: 13px/20px 'Lucida Grande', Tahoma, Verdana, sans-serif;
  color: #404040;
  background: #fafafa;
}

.container {
  margin: 50px auto;
  width: 640px;
  text-align: center;
}
.container .button {
  margin: 0 10px 25px;
}

.button {
  margin: 0 0 5px;
  padding: 0 12px;
  height: 28px;
  line-height: 28px;
  font-size: 11px;
  font-weight: bold;
  color: #555555;
  text-decoration: none;
  text-shadow: 0 1px white;
  background: #dfdfdf;
  border-width: 1px 1px 0;
  border-style: solid;
  border-color: #cecece #bababa #a8a8a8;
  border-radius: 3px 3px 2px 2px;
  outline: 0;
  display: inline-block;
  vertical-align: baseline;
  zoom: 1;
  *display: inline;
  *vertical-align: auto;
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
  background-image: -webkit-linear-gradient(top, #f1f1f1, #dfdfdf 70%, #dadada);
  background-image: -moz-linear-gradient(top, #f1f1f1, #dfdfdf 70%, #dadada);
  background-image: -o-linear-gradient(top, #f1f1f1, #dfdfdf 70%, #dadada);
  background-image: linear-gradient(to bottom, #f1f1f1, #dfdfdf 70%, #dadada);
  -webkit-box-shadow: inset 0 1px #fdfdfd, inset 0 0 0 1px #eaeaea, 0 1px #a8a8a8, 0 3px #bbbbbb, 0 4px #a8a8a8, 0 5px 2px rgba(0, 0, 0, 0.25);
  box-shadow: inset 0 1px #fdfdfd, inset 0 0 0 1px #eaeaea, 0 1px #a8a8a8, 0 3px #bbbbbb, 0 4px #a8a8a8, 0 5px 2px rgba(0, 0, 0, 0.25);
}
.button:hover, .button:active {
  background: #dfdfdf;
  border-top-color: #c9c9c9;
}
.button:active{
  vertical-align: -5px;
  margin-bottom: 0;
  padding: 1px 13px 0;
  border-width: 0;
  border-radius: 3px;
  -webkit-box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.3), inset 0 1px 1px rgba(0, 0, 0, 0.4), 0 1px white;
  box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.3), inset 0 1px 1px rgba(0, 0, 0, 0.4), 0 1px white;
}

</style>
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body>
  <section class="container">
    <a href="#" class="button">Download</a>
  </section>

</body>
</html>
