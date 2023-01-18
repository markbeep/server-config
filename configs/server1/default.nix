# Main config for Server 1
{
  name = "Testing Server 1";
  #icon = ./banger-icon.jpg;
  #banner = ./banner.jpg;

  # most channels are sorted into categories
  categories = import ./categories;

  # chanels not in any category
  extraChannels = import ./extraChannels.nix;

  emotes = import ./emotes;

  roles = import ./roles;

  stickers = import ./stickers;
}
