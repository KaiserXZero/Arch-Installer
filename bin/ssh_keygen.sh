ssh-keygen -b 16384 -t ed25519
cp ~/.ssh/id_ed25519.pub ~/.ssh/authorized_keys
cp ~/.ssh/id_ed25519 ~/.ssh/identity
rm ~/.ssh/id_ed25519*
chmod 600 ~/.ssh/identity
