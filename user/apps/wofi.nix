{ config, inputs, lib, ... }:{
programs.wofi = {
    enable = true;
    settings = {
      width = 600;
      height = 400;
      show = "drun";
      prompt = "Search...";
      allow_images = true;
      insensitive = true;
    };
    # style = ''
    #   window {
    #     background-color: #1a1b26;
    #     color: #c0caf5;
    #     border: 2px solid #7aa2f7;
    #     border-radius: 8px;
    #   }
    #   
    #   #input {
    #     margin: 5px;
    #     border: 1px solid #414868;
    #     background-color: #24283b;
    #     color: #c0caf5;
    #   }
    #   
    #   #inner-box {
    #     background-color: #1a1b26;
    #   }
    #   
    #   #outer-box {
    #     margin: 5px;
    #   }
    #   
    #   #scroll {
    #     margin: 5px;
    #   }
    #   
    #   #entry:selected {
    #     background-color: #7aa2f7;
    #     color: #1a1b26;
    #   }
    # '';
  };

}
