function validarCPF(cpf) {
	var filtro = /^\d{3}.\d{3}.\d{3}-\d{2}$/i;

	if (!filtro.test(cpf)) {
		alert("CPF inválido. Tente novamente.");
		
		return false;
	}

	cpf = remove(cpf, ".");
	cpf = remove(cpf, "-");

	if (cpf.length != 11 || cpf == "00000000000" || cpf == "11111111111"
			|| cpf == "22222222222" || cpf == "33333333333"
			|| cpf == "44444444444" || cpf == "55555555555"
			|| cpf == "66666666666" || cpf == "77777777777"
			|| cpf == "88888888888" || cpf == "99999999999") {
		alert("CPF inválido. Tente novamente.");
		return false;
	}

	soma = 0;
	for (i = 0; i < 9; i++) {
		soma += parseInt(cpf.charAt(i)) * (10 - i);
	}

	resto = 11 - (soma % 11);
	if (resto == 10 || resto == 11) {
		resto = 0;
	}
	if (resto != parseInt(cpf.charAt(9))) {
		alert("CPF inválido. Tente novamente.");
	

		return false;
	}

	soma = 0;
	for (i = 0; i < 10; i++) {
		soma += parseInt(cpf.charAt(i)) * (11 - i);
	}
	resto = 11 - (soma % 11);
	if (resto == 10 || resto == 11) {
		resto = 0;
	}

	if (resto != parseInt(cpf.charAt(10))) {
		window.alert("CPF inválido. Tente novamente.");
		return false;
	}

	return true;
}

function remove(str, sub) {
	i = str.indexOf(sub);
	r = "";
	if (i == -1)
		return str;
	{
		r += str.substring(0, i) + remove(str.substring(i + sub.length), sub);
	}

	return r;
}

//valida campo nome
function soLetras(obj) {
	var tecla = (window.event) ? event.keyCode : obj.which;
	if ((tecla >= 65 && tecla <= 90) || (tecla >= 97 && tecla <= 122))
		return true;
	else {
		if (tecla != 8 && tecla !=32 && tecla !=11 )
			return false;
		else
			return true;
	}
	
}


// validação de campos

function mascara(o,f){
	v_obj=o
	v_fun=f
	setTimeout("execmascara()",1)
	}
	function execmascara(){
	v_obj.value=v_fun(v_obj.value)
	}
	function soLetras(v){
	return v.replace(/\d/g,"") //Remove tudo o que não é Letra
	}
	function soLetrasMA(v){
	v=v.toUpperCase() //Maiúsculas
	return v.replace(/\d/g,"") //Remove tudo o que não é Letra ->maiusculas
	}
	function soLetrasMI(v){
	v=v.toLowerCase() //Minusculas
	return v.replace(/\d/g,"") //Remove tudo o que não é Letra ->minusculas
	}
	function soNumeros(v){
	return v.replace(/\D/g,"") //Remove tudo o que não é dígito
	}

	//'onkeypress="mascara(this,soLetras)"
//Valida datas
	
	 function validaDat(campo,valor) {
			var date=valor;
			var ardt=new Array;
			var ExpReg=new RegExp("(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}");
			ardt=date.split("/");
			erro=false;
			if ( date.search(ExpReg)==-1){
				erro = true;
				}
			else if (((ardt[1]==4)||(ardt[1]==6)||(ardt[1]==9)||(ardt[1]==11))&&(ardt[0]>30))
				erro = true;
			else if ( ardt[1]==2) {
				if ((ardt[0]>28)&&((ardt[2]%4)!=0))
					erro = true;
				if ((ardt[0]>29)&&((ardt[2]%4)==0))
					erro = true;
			}
			if (erro) {
				alert("  Data Inválida!");
				
				campo.value = "";
				return false;
			}
			return true;
		}
		 
	

		/*
		 *  jquery-maskmoney - v3.0.2
		 *  jQuery plugin to mask data entry in the input text in the form of money (currency)
		 *  https://github.com/plentz/jquery-maskmoney
		 *
		 *  Made by Diego Plentz
		 *  Under MIT License (https://raw.github.com/plentz/jquery-maskmoney/master/LICENSE)
		 */
		!function($){"use strict";$.browser||($.browser={},$.browser.mozilla=/mozilla/.test(navigator.userAgent.toLowerCase())&&!/webkit/.test(navigator.userAgent.toLowerCase()),$.browser.webkit=/webkit/.test(navigator.userAgent.toLowerCase()),$.browser.opera=/opera/.test(navigator.userAgent.toLowerCase()),$.browser.msie=/msie/.test(navigator.userAgent.toLowerCase()));var a={destroy:function(){return $(this).unbind(".maskMoney"),$.browser.msie&&(this.onpaste=null),this},mask:function(a){return this.each(function(){var b,c=$(this);return"number"==typeof a&&(c.trigger("mask"),b=$(c.val().split(/\D/)).last()[0].length,a=a.toFixed(b),c.val(a)),c.trigger("mask")})},unmasked:function(){return this.map(function(){var a,b=$(this).val()||"0",c=-1!==b.indexOf("-");return $(b.split(/\D/).reverse()).each(function(b,c){return c?(a=c,!1):void 0}),b=b.replace(/\D/g,""),b=b.replace(new RegExp(a+"$"),"."+a),c&&(b="-"+b),parseFloat(b)})},init:function(a){return a=$.extend({prefix:"",suffix:"",affixesStay:!0,thousands:",",decimal:".",precision:2,allowZero:!1,allowNegative:!1},a),this.each(function(){function b(){var a,b,c,d,e,f=s.get(0),g=0,h=0;return"number"==typeof f.selectionStart&&"number"==typeof f.selectionEnd?(g=f.selectionStart,h=f.selectionEnd):(b=document.selection.createRange(),b&&b.parentElement()===f&&(d=f.value.length,a=f.value.replace(/\r\n/g,"\n"),c=f.createTextRange(),c.moveToBookmark(b.getBookmark()),e=f.createTextRange(),e.collapse(!1),c.compareEndPoints("StartToEnd",e)>-1?g=h=d:(g=-c.moveStart("character",-d),g+=a.slice(0,g).split("\n").length-1,c.compareEndPoints("EndToEnd",e)>-1?h=d:(h=-c.moveEnd("character",-d),h+=a.slice(0,h).split("\n").length-1)))),{start:g,end:h}}function c(){var a=!(s.val().length>=s.attr("maxlength")&&s.attr("maxlength")>=0),c=b(),d=c.start,e=c.end,f=c.start!==c.end&&s.val().substring(d,e).match(/\d/)?!0:!1,g="0"===s.val().substring(0,1);return a||f||g}function d(a){s.each(function(b,c){if(c.setSelectionRange)c.focus(),c.setSelectionRange(a,a);else if(c.createTextRange){var d=c.createTextRange();d.collapse(!0),d.moveEnd("character",a),d.moveStart("character",a),d.select()}})}function e(b){var c="";return b.indexOf("-")>-1&&(b=b.replace("-",""),c="-"),c+a.prefix+b+a.suffix}function f(b){var c,d,f,g=b.indexOf("-")>-1&&a.allowNegative?"-":"",h=b.replace(/[^0-9]/g,""),i=h.slice(0,h.length-a.precision);return i=i.replace(/^0*/g,""),i=i.replace(/\B(?=(\d{3})+(?!\d))/g,a.thousands),""===i&&(i="0"),c=g+i,a.precision>0&&(d=h.slice(h.length-a.precision),f=new Array(a.precision+1-d.length).join(0),c+=a.decimal+f+d),e(c)}function g(a){var b,c=s.val().length;s.val(f(s.val())),b=s.val().length,a-=c-b,d(a)}function h(){var a=s.val();s.val(f(a))}function i(){var b=s.val();return a.allowNegative?""!==b&&"-"===b.charAt(0)?b.replace("-",""):"-"+b:b}function j(a){a.preventDefault?a.preventDefault():a.returnValue=!1}function k(a){a=a||window.event;var d,e,f,h,k,l=a.which||a.charCode||a.keyCode;return void 0===l?!1:48>l||l>57?45===l?(s.val(i()),!1):43===l?(s.val(s.val().replace("-","")),!1):13===l||9===l?!0:!$.browser.mozilla||37!==l&&39!==l||0!==a.charCode?(j(a),!0):!0:c()?(j(a),d=String.fromCharCode(l),e=b(),f=e.start,h=e.end,k=s.val(),s.val(k.substring(0,f)+d+k.substring(h,k.length)),g(f+1),!1):!1}function l(c){c=c||window.event;var d,e,f,h,i,k=c.which||c.charCode||c.keyCode;return void 0===k?!1:(d=b(),e=d.start,f=d.end,8===k||46===k||63272===k?(j(c),h=s.val(),e===f&&(8===k?""===a.suffix?e-=1:(i=h.split("").reverse().join("").search(/\d/),e=h.length-i-1,f=e+1):f+=1),s.val(h.substring(0,e)+h.substring(f,h.length)),g(e),!1):9===k?!0:!0)}function m(){r=s.val(),h();var a,b=s.get(0);b.createTextRange&&(a=b.createTextRange(),a.collapse(!1),a.select())}function n(){setTimeout(function(){h()},0)}function o(){var b=parseFloat("0")/Math.pow(10,a.precision);return b.toFixed(a.precision).replace(new RegExp("\\.","g"),a.decimal)}function p(b){if($.browser.msie&&k(b),""===s.val()||s.val()===e(o()))a.allowZero?a.affixesStay?s.val(e(o())):s.val(o()):s.val("");else if(!a.affixesStay){var c=s.val().replace(a.prefix,"").replace(a.suffix,"");s.val(c)}s.val()!==r&&s.change()}function q(){var a,b=s.get(0);b.setSelectionRange?(a=s.val().length,b.setSelectionRange(a,a)):s.val(s.val())}var r,s=$(this);a=$.extend(a,s.data()),s.unbind(".maskMoney"),s.bind("keypress.maskMoney",k),s.bind("keydown.maskMoney",l),s.bind("blur.maskMoney",p),s.bind("focus.maskMoney",m),s.bind("click.maskMoney",q),s.bind("cut.maskMoney",n),s.bind("paste.maskMoney",n),s.bind("mask.maskMoney",h)})}};$.fn.maskMoney=function(b){return a[b]?a[b].apply(this,Array.prototype.slice.call(arguments,1)):"object"!=typeof b&&b?($.error("Method "+b+" does not exist on jQuery.maskMoney"),void 0):a.init.apply(this,arguments)}}(window.jQuery||window.Zepto);