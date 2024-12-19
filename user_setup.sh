#! /bin/bash


# Check if the script is run as root
if [ $"(id -u)" != 0 ]; then 
	echo "please run as a root"
fi 

# Prompt for username
echo "please enter the username"
read username

# Create the user
useradd -m $username

# Set password
echo "Please enter a password"
passwd $username 

if [ $? -eq 0 ]; then 
	echo "Password set successfully for $username"
	chage -d 0 $username  # Force password change at next login
else 
	echo "Failed to set password for the $username"

# Prompt for group assignment
echo "please add the $username to a group"
read group

# Add the user to the specified groupengin 
if [ $group == "hr" ]; then 

	 usermod -aG $group $username
	echo "$username been added into the HR group"

elif [ $group == "engineer" ]; then 
	usermod -aG $group $username
	echo "username been added into the Engineer group"
elif [ $group == "marketing" ]; then 
	usermod -aG $group $username
	echo "$username been added into the Marketing group"
else
	echo " There is no such group"
fi 
	
	
	