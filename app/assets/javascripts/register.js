 $(document).ready(function() {
     var moneda = $('#id_categoria').val();
     var campo = $('#dolares').val();
     var campo2 = $('#soles').val();
     var combito = $('.combito').val();
     if (campo === '' || campo2 === '') {
         $(".contenido").hide();
         $("#combito").change(function() {
             $(".contenido").hide();
             $("#div_" + $(this).val()).show();
         });
     } else if (combito == '1') {
         $(".contenido2").hide();
         if (moneda == 'DOLARES') {
             $("#dolares").prop("disabled", false);
             $("#soles").hide();
         } else {
             $("#soles").prop("disabled", false);
             $("#dolares").hide();
         }
     }
 });
 $(document).ready(function() {
     var moneda = $('#id_categoria').val();
     var campos = $('#dolaress').val();
     var campos2 = $('#soless').val();
     var combito = $('.combito').val();
     if (campos === '' || campos2 === '') {
         $(".contenido2").hide();
         $("#combito").change(function() {
             $(".contenido2").hide();
             $("#div_" + $(this).val()).show();
         });
     } else if (combito == '2') {
         $(".contenido").hide();
         if (moneda == 'DOLARES') {
             $("#dolaress").prop("disabled", false);
             $("#soless").hide();
         } else {
             $("#soless").prop("disabled", false);
             $("#dolaress").hide();
         }
     }
 });
 $(document).ready(function() {
     $("#id_categoria").change(function() {
         if ($(this).val() === "SOLES") {
             $("#soles").show();
             $("#soless").show();
             $("#dolares").prop("disabled", true);
             $("#soles").prop("disabled", false);
             $("#dolaress").prop("disabled", true);
             $("#soless").prop("disabled", false);
         } else {
             $("#dolares").show();
             $("#dolaress").show();
             $("#soles").prop("disabled", true);
             $("#dolares").prop("disabled", false);
             $("#soless").prop("disabled", true);
             $("#dolaress").prop("disabled", false);
         }
     });
 });