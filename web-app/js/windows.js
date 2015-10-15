var win;
function winaddmark()
{
win = new Window({className: "bluelighting", title: "Добавить оценку", width:300, height:200, destroyOnClose: true, recenterAuto:false});
win.getContent().innerHTML = "<div id='addmark'></div>";
win.showCenter(true); 
}
function winaddmarkclose()
{
win.destroy();
document.location.reload(true);
document.location = href;
}