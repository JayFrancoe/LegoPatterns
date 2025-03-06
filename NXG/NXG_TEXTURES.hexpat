struct String32
{
    u32 size;
    char c_data[size];
};
struct String16
{
    u16 size;
    char c_data[size];
};

struct NuTexGenHDR_V1
{
    u128 NuChecksum;
    String32 Path;
};

struct NuTexGenHDR_V12
{
    u128 NuChecksum;
    String16 Name;
    String16 Path;
    u8 NuTType;
};

struct NuTexGenHDR_V14
{
    NuTexGenHDR_V12 HDR;
    u8 Unknown1;
    u8 Unkown2;
    u16 Unknown3;
    String16 Unkown4;
    u8 fixupTypeAsU8;
};

struct NuTextureSet
{
    u32 FourCC;
    u32 Version;
    if (Version)
    {
        String32 Convdate;
    }

    u32 VectorFourCC;
    u32 NumHeaders;

    if (Version == 1)
        NuTexGenHDR_V1 Files[NumHeaders];
    if (Version == 12)
        NuTexGenHDR_V12 Files[NumHeaders];
    if (Version == 14)
        NuTexGenHDR_V14 Files[NumHeaders];
};

struct NXG_TEXTURES
{
    u32 BlockSize;
    u32 FourCC_Identifier;
    u32 FourCC;

    u32 TXSTCount;
    NuTextureSet TXST;
};


be u32 RESHSize @ 0;
$ += RESHSize;

be NXG_TEXTURES file @ $;
