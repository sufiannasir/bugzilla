	jQuery(document).ready(function($){
  // $('#feature_status').hide();
  $('#bug_status').hide();

  $("#bug_type").change(function(){
  
  if( $('#bug_type').val() == 'bug')
  {
  $('#feature_status').hide();

  $('#bug_status').show()
  }
  else if( $('#bug_type').val() == 'feature')
  {
  $('#bug_status').hide();
  $('#feature_status').show();

  }
  });
  });