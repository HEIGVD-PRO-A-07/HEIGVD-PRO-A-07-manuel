$ROOM_PREFIX = "ROOM_"
$NB_ROOM = 3;
$NB_PC_ROOM = 5;

For($i=1; $i -le $NB_ROOM; $i++){

    $GROUP_NAME = $ROOM_PREFIX + $i

    New-ADGroup -Name $GROUP_NAME -SamAccountName $GROUP_NAME -GroupCategory Security -GroupScope DomainLocal -DisplayName $GROUP_NAME -Path "CN=Users,DC=PRO,DC=local"

    $ROOM_NAME = "R0" + $i

    For($j=1;$j -le $NB_PC_ROOM;$j++){

        $COMP_NAME = $ROOM_NAME + "PC0" + $j
        New-ADComputer -Name $COMP_NAME -SAMAccountName $COMP_NAME
        Add-ADGroupMember -Identity $GROUP_NAME -Members (Get-ADComputer $COMP_NAME)
    }


}
