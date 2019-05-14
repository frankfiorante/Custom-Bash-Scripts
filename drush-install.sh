# Make sure you have the latest version of drush from
# https://github.com/drush-ops/drush-launcher

# Download latest stable release of Drush
echo "Grabbing latest version of Drush"
wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/download/0.6.0/drush.phar

# Make file executable
echo "Making file executable"
chmod +x drush.phar

# Move drush.phar to a location listed in your $PATH, rename to drush
echo "Moving drush.phar to /usr/local/bin/drush"
sudo mv drush.phar /usr/local/bin/drush

# Require Drush on a per-project basis via Composer
echo "Adding drush to composer"
composer require drush/drush

# Show Where Drush Is installed
echo "which drush"
which drush