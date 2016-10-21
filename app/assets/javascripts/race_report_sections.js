$(document).on("turbolinks:load", function() {
  var sectionTemplate = $(".section-item").first().clone();

  var reportSections = document.getElementById("race-report-sections");
  if (reportSections !== null && reportSections !== undefined) {
    Sortable.create(reportSections, { handle: ".section-item-handle", chosenClass: "section-item-chosen", animation: 150,
      onSort: function(e) { updateSectionsOrder(); }
    });
  }

  updateSectionsOrder = function() {
    $(".section-item:visible").each(function(index, element) {
      $(element).find("input[type=hidden][id$='order']").val(++index);
    });
  };

  $("body").on("click", "#addNewSection", function(e) {
    e.preventDefault();

    var newSection = $(sectionTemplate).hide().clone();
    var sectionsOnPage = $(".section-item").length;

    $(newSection).find("label").each(function(index, element) {
      var oldLabel = $(this).attr("for");
      var newLabel = oldLabel.replace(new RegExp(/_[0-9]+_/), "_" + sectionsOnPage + "_")
      $(this).attr("for", newLabel);
    });

    $(newSection).find("select, input, textarea").each(function(index, element) {
      var oldId = $(this).attr("id");
      var newId = oldId.replace(new RegExp(/_[0-9]+_/), "_" + sectionsOnPage + "_");
      $(this).attr("id", newId);

      var oldName = $(this).attr("name");
      var newName = oldName.replace(new RegExp(/\[[0-9]+\]/), "[" + sectionsOnPage + "]")
      $(this).attr("name", newName);

      $(this).val("");
    });

    $(newSection).find("div.field_with_errors").toggleClass("field_with_errors field");

    $(newSection).appendTo("#race-report-sections").slideDown();

    updateSectionsOrder();
  });

  $("body").on("click", ".section-item-remove", function(e) {
    e.preventDefault();

    if ($(".section-item:visible").length == 1) {
      alert("You need to have at least one section");
    } else {
      var currentSection = $(this).parents(".section-item");

      if ($(currentSection).find("input[type=hidden][id$='id']").val() == "") {
        $(currentSection).slideUp(400, function() { $(this).remove(); });
      } else {
        $(currentSection).find("input[type=hidden][id$='destroy']").val("1");
        $(currentSection).slideUp(400, function() { $(this).hide(); });
      }

      updateSectionsOrder();
    }
  });
});
