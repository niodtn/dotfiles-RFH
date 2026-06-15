{
  inputs,
  config,
  ...
}: {
  system.defaults = {
    dock = {
      autohide = true;
      minimize-to-application = true;
      mru-spaces = false;
      scroll-to-open = true;
      show-recents = false;
      # static-only = true;
      mineffect = "scale";

      # corners
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
    };

    finder = {
      ShowStatusBar = true;
      ShowPathbar = true;
      FXRemoveOldTrashItems = true;
      AppleShowAllExtensions = true;
      _FXEnableColumnAutoSizing = true;
      _FXSortFoldersFirst = true;
      FXEnableExtensionChangeWarning = false;
    };

    WindowManager = {
      EnableTiledWindowMargins = false;
      EnableStandardClickToShowDesktop = false;
    };

    NSGlobalDomain = {
      AppleShowScrollBars = "WhenScrolling";
      NSDocumentSaveNewDocumentsToCloud = false;
      NSNavPanelExpandedStateForSaveMode = true;

      # Menu Bar
      AppleICUForce24HourTime = true;
      _HIHideMenuBar = false;

      # Keyboard
      "com.apple.keyboard.fnState" = true;
      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 10;
      KeyRepeat = 1;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticInlinePredictionEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
    };
  };
}
