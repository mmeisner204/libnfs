rem build script for win32
rem set the 
rem



rem NFS
rem
cl /I. /Iinclude -Zi -Od -c -DWIN32 -D_WIN32_WINNT=0x0600 -MDd nfs\libnfs-raw-nfs.c -Fonfs\libnfs-raw-nfs.obj
cl /I. /Iinclude -Zi -Od -c -DWIN32 -D_WIN32_WINNT=0x0600 -MDd nfs\nfs.c -Fonfs\nfs.obj
cl /I. /Iinclude -Zi -Od -c -DWIN32 -D_WIN32_WINNT=0x0600 -MDd nfs\nfsacl.c -Fonfs\nfsacl.obj



rem
rem RQUOTA
rem
cl /I. /Iinclude -Zi -Od -c -DWIN32 -D_WIN32_WINNT=0x0600 -MDd rquota\libnfs-raw-rquota.c -Forquota\libnfs-raw-rquota.obj
cl /I. /Iinclude -Zi -Od -c -DWIN32 -D_WIN32_WINNT=0x0600 -MDd rquota\rquota.c -Forquota\rquota.obj



rem
rem PORTMAP
rem
cl /I. /Iinclude -Zi -Od -c -DWIN32 -D_WIN32_WINNT=0x0600 -MDd portmap\libnfs-raw-portmap.c -Foportmap\libnfs-raw-portmap.obj
cl /I. /Iinclude -Zi -Od -c -DWIN32 -D_WIN32_WINNT=0x0600 -MDd portmap\portmap.c -Foportmap\portmap.obj


rem
rem MOUNT
rem
cl /I. /Iinclude -Zi -Od -c -DWIN32 -D_WIN32_WINNT=0x0600 -MDd mount\libnfs-raw-mount.c -Fomount\libnfs-raw-mount.obj
cl /I. /Iinclude -Zi -Od -c -DWIN32 -D_WIN32_WINNT=0x0600 -MDd mount\mount.c -Fomount\mount.obj



rem
rem generate core part of library
rem
cl /I. /Iinclude -Zi -Od -c -DWIN32 -D_WIN32_WINNT=0x0600 -MDd lib\init.c -Folib\init.obj
cl /I. /Iinclude -Zi -Od -c -DWIN32 -D_WIN32_WINNT=0x0600 -MDd -D_U_="" lib\pdu.c -Folib\pdu.obj
cl /I. /Iinclude -Zi -Od -c -DWIN32 -D_WIN32_WINNT=0x0600 -MDd -D_U_="" lib\socket.c -Folib\socket.obj
cl /I. /Iinclude /Imount /Infs -Zi -Od -c -DWIN32 -D_WIN32_WINNT=0x0600 -MDd -D_U_="" lib\libnfs.c -Folib\libnfs.obj
cl /I. /Iinclude /Imount /Infs -Zi -Od -c -DWIN32 -D_WIN32_WINNT=0x0600 -MDd -D_U_="" lib\libnfs-sync.c -Folib\libnfs-sync.obj



rem
rem create a linklibrary/dll
rem
lib /out:lib\libnfs.lib /def:lib\libnfs-win32.def nfs\nfs.obj nfs\nfsacl.obj nfs\libnfs-raw-nfs.obj rquota\rquota.obj rquota\libnfs-raw-rquota.obj mount\mount.obj mount\libnfs-raw-mount.obj portmap\portmap.obj portmap\libnfs-raw-portmap.obj lib\init.obj lib\pdu.obj lib\socket.obj lib\libnfs.obj lib\libnfs-sync.obj

link /DLL /out:lib\libnfs.dll /DEBUG /DEBUGTYPE:cv lib\libnfs.exp nfs\nfs.obj nfs\nfsacl.obj nfs\libnfs-raw-nfs.obj rquota\rquota.obj rquota\libnfs-raw-rquota.obj mount\mount.obj mount\libnfs-raw-mount.obj portmap\portmap.obj portmap\libnfs-raw-portmap.obj lib\init.obj lib\pdu.obj lib\socket.obj lib\libnfs.obj lib\libnfs-sync.obj ws2_32.lib



rem
rem build a test application
rem
cl /I. /Iinclude /Imount /Infs -Zi -Od -DWIN32 -D_WIN32_WINNT=0x0600 -MDd -D_U_="" examples\nfsclient-sync.c lib\libnfs.lib WS2_32.lib kernel32.lib mswsock.lib advapi32.lib wsock32.lib advapi32.lib








