﻿object WindowConfigs: TWindowConfigs
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Configura'#231#245'es'
  ClientHeight = 330
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  DesignSize = (
    249
    330)
  PixelsPerInch = 96
  TextHeight = 13
  object BtnDBFile: TSpeedButton
    Left = 294
    Top = 173
    Width = 27
    Height = 24
    Cursor = crHandPoint
    Anchors = [akTop]
    ParentShowHint = False
    ShowHint = True
  end
  object BtnSave: TSpeedButton
    Left = 144
    Top = 297
    Width = 97
    Height = 25
    Action = ActSave
  end
  object BtnDiscard: TSpeedButton
    Left = 8
    Top = 297
    Width = 97
    Height = 25
    Action = ActCancel
  end
  object PageConfigs: TPageControl
    Left = 0
    Top = 0
    Width = 249
    Height = 297
    ActivePage = TabConta
    TabOrder = 0
    TabStop = False
    object TabConta: TTabSheet
      Caption = 'Conta'
      object Logo: TImage
        Left = 3
        Top = 3
        Width = 233
        Height = 65
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000E60000
          00410806000000C573D8ED0000200A4944415478DAED5D0BBC5545B99F99F538
          07AF70CE01444B4DF241D7F21A8A5D115F28A224643ED2947B956E4926565EE3
          6A84665A9A17E99699E2232DB3FAA5095A6AA264A2562086286252890F14F211
          6AA02067AFC7DCFF376BADBDD7DE7B3D669D7D1E70D8A38BB5CF5A6B66BEEF9B
          EF3FCF6FBEE16D6D6D2C2D0829F18F608C73C6E901FE94D2C70FAEFE577FE33F
          FA699A26F37D1FEF2513F48AE2E062940653376424F714C2D8DD97FEEE86610C
          97BE8F677C20BEB0F08987F71B8410EF789EF732E23EEF79FE0B82B3E738176F
          C92033FA9F7164207DE483F4436A54BE147C7A8E48BE0C32354D013A04F38836
          CFC7F792150E52230EE44452E2F896E3B78CC5019F78C6C33F025AA5EFC5E21A
          882E94FC84925B9065251D19F0C3E33405371E7E4FAF7CF0C722B9AB77813C64
          2DCFF13FE374D4F164543215E99F29F9FB5932E2D5B4474F952E257DCE5345AE
          64935F1AD945C57943F17D3F9B02E876A1F4A88C950C499F5D27E0B307816940
          41F6C77524DE1F04251B89DF3BE1554BB594634CD6FC8D9FA052BE813457E05A
          04C55B88B74B81B3CD4D6046226B02B368D85681B9A721C44950B4E3A158FBE3
          95DDA01CCB7921711732791634FCCAF7BCB950C0154D60368159346C6BC02410
          4E83829D08C5E86850763ADC6CF4A5BCC7F5BC6B91FF1F9AC06C0253376C13C0
          44D8C310FC02D3B24EC7EF010DCAAC7000092E5ACF3B302EBD02E4AE505DE926
          30C3774D6026B2D5AF81C9A42D84F145D334BE0A4518D6A0AC1A0E606E23C079
          95EBBAB36802A909CC263053D9EA8FC0F4214CFCB5170079350898D0A08CBA35
          9042BAAEB708003D0F4AFE383D6B02B309CC3AB6FA1F302515FAF1184F5E17CE
          B06EA1416E741CF75CD7F36FB69AC06C02B396ADFE064CFC3BDDB2CCFFC54FB3
          41D9F44A701C67366E33A0F47E1398F571556802B370D872801964F64DD330BE
          DEA04C7A3D40D97F04C6CF0230DD2630ABE306026A02B368D8628009A5B9CC32
          CD0B1B94479F0528FC4F5CCF3B13C0749BC0644D606EEDC0E46A56D3BC08D7B7
          1A94459F07D7F5AE735D779A6C02B309CCAD1A98F8D810E274DBB67FC212C5BA
          F5058C3967BA9E7B4561761A07E68E00E647F0736F68D5EE78370CD7762C34FD
          85B6BD0730BD8367AF4369D6E0C96ABCF90BD2592BD5FA541398B157DB063007
          0D1A949CB810070094BF43844139A906D2EAEBA0438794A592E39EE049FFBE42
          69FB7EFE37F5C0249BE04FE07E2AAE03F17B9722598293B700B067C1D502B035
          17BAB0720B06E61E00E6CE4C6D44A84F055FACC247AFD6C54B06A605C2F78318
          497EB51F10A63A41FE53F85D2A22CFDA441A0816643A12F7D604FA28610FC024
          FADED34D501B985CB2B69616FB6164305266B41678F71CBA875F4437AC059F8D
          340C71141E8F8662346E1F9BCB0DE99CBFD4F37D282E7F02E3C7770DD3BC5C08
          FEEF394278A5B3541A03AED668E7551C98C7A35B3A13797DAC9BB85D8F167732
          F82C572851AD1D03E63000F340FC3104CF56E1D563B4ACDB6DC04CD76513427D
          18F78333E8BF09D7D4BAA709C004370743411F65E95501451A8BEBF73A8223D9
          E4B5609EE7E92415858351C48FE09E9A28E7623C6E0F6AA51656AAF55DD941D5
          5D5902A2651ADF416B395DE674E1C0D09500C657D1BAE2B78F56964CE1E468D3
          303E0FE5380D14B6A6094BC66AFC78DEB5EF13828FF1E23C740FE740E17E0F18
          7864821774A5F839B66D5E93270B5426B7E13A4DB724F2E4A042004C1B849069
          E05774D3D609AAE0043F11B7BBCA42A86A31F934C8E37CD039BC2263BE107239
          0FC05CDE2DC04C0FA884E512DC47667CF30B5C93EB9EAA0AAF56B67C3C64B920
          27CFA371FD365770E1D8DEB2B3DB09A7540AF44788DC2411087439F4F149F8E7
          373A8909235076AAD4D3C798441B6707D92DF6427CD8929768C9713E0185B837
          00178F80A92632A02407208D0B0DD338BE9C7C60CFB71EF7BF23CE6BB8BF8D96
          65330BBA2536B5BC78DE86E73BE2BE33AE76165B33F53DEF4154049743D91E0E
          F20C075E68E269BE15CFF66B696D2125B172692F954EF2A4BC3357ED68A24603
          9868255BF1D9CDF87872EEC70503E4F82637F87EF8F98A92436C8C03319C8D7C
          E724D56490C72BA0FE30FC7CA99AA7D8EFEE01E622DC47657CF3735CFF59F734
          1998E3A04079AD0DF5CC7E97F9851A9A07C30A3D6006C300B5D9373B8C63B9AD
          213F16FFCCCFFA4235268A3E3D609A2D96F9009AFE23F3541189BEE3382EC64E
          726530BCAB00935A50BA7BAE87B235A6808871487B29E23C0D20AEC2E7EBD02A
          6FA63C4A25B79CA665198A50CFF130CE60D425DB0369ED83EF46A3467BDAF3BD
          ABD14DF0646081C42260CA103CD49DB35BACA5F866D74CB1E1F27CB9B2D329D1
          D8EF9D1C46B5267F40CF8DF86C6AEE875D0A7231683E94A9311CF5CDCACAF33E
          74E1693C9365AB7C2D6ADB2F563D894F5EF4476086A054A91501A68A900BCE86
          81491215215652813928D69505084E6C6DB1E6E9F4DC0094B568310FC0CFD702
          7EEA8189164E6D0A235E45C8ACDAB3893B80A9EE0077394DD32C033368081151
          6D8656CB0BB8547F3CAC69CAC00C6704833F0758B6B5182DEF47F3E8A7F89D9B
          377FC5759CEF654D1AF1D8644AEA37429C8956EC87F952EB5A40F65781E9F3A2
          BF45346692EC24F420E6E694D44A504F63DD8D41942A5E0E81F00EC2DD4D8888
          CA51AC40EEF3B3D3DFC280A92AD2CAD8B5303083485913898D0133D4DD5C6076
          545A4CCBB4CC8586300E661A016058DD5952C05CA71262AA1BACFEE90D6006CF
          FDEAD64C4AC36A69F9238079A00E0FA0E5F94EC721855A9F2A62DFCF6E3139DF
          05DC2D05753BEAE4D99500E53A19B7B9A1E0E35DEB33F136A74290AB11A15C4E
          35ADC12DB8A664447E88058A18A7A6F69B2D079835A00C65571C98919C92C1D9
          7560866BD264BB9D0BCCC11DED5162136CCBCAAB1D2B79F8F20DB4985413BF5C
          2647F1D39BC00C188A8581A6652C0130F7D6E5033C4C453A37A57E403C640013
          34CE021517E8E607B25F00CD8B9022ED1D7D158C6D0A9E8B012CD860BE339E8F
          C09DD63D47207D17713E82EFFF562EDB4A188F070BB2F3E3CB208F31F8D9A9D8
          A9AE686E642CB3FB7D3FAE8FD7A458FBCD9601CC0450AAD4BA0ACC20721238BB
          08CCCA90480B98D118D336CDDB4CC3F8B4FEE2AD2C757696C640899EA8CD9FDC
          8C50F9F5243069FC5A270ECE3FD03AA0E549DC07EB72011A17953C6F2C9192C8
          A552E4D4E8B4C3E6C9F09E5D549CBF08BA2F4777FF4EFCF1B65AC650633DBF5C
          58554AC0F940EA82E28BF783E5DB58D8DD8CD62CC3B0BDEFF98B218E7DD2F215
          869881DBAC32BFD5FCDC80EBF3196493721D5B23101050B552D0F7C04C01A54A
          AD11600609D482B330307934E42A02CC76054C28B46D2D67C12CA876F05CF702
          64363BE91D65254310762F30598655083FC5B6ADDB8BF0407E844AAE7B10F858
          9AFC5A6601F37332ABB52DD3C5A87B7D3A40F422F1477C6900B3E22422FEB8FA
          4F92F16148E657F8D99190EF7DD08053F073A364A1E0AAAD568A01339C28E218
          E34A59A6A24F81C99595909FBAD6DC2830D5FC8230E2BDA642C0340C5EAE0C0B
          0193D6310D437CA1C5B2AE2B68EA243DCFFB2C6EB7D4BF09CABFA780E94B9938
          5788EFC75B96F56BDC0BB938713DEF0AB49C3313992CFF93F04ECA3B719D9059
          44D4751582962CD6D2EE968681995051203D1A537F0DDD549AC8D91E7FAF4145
          300FB45D06696F8A9250CB58B4C3A6A264FAC08CCDDED2E493AA788364BA06CC
          44502A4A8B0153040D404F019364C60D336E84A00DCC00D33CB0C82A0ACCF6B6
          0E8044DC651895F5C6BC408AE5949C6B7CDFFB52EAEC95ACDC7A02986901DDF1
          F3D195BE52971745A3F49738AE4BCB11F5DDD9F4D592A128CC1532A71B8B8299
          8CF8BF08989709C0AC58F06402B34C433531A45024591E18798016B91D804313
          3D1B240D25C2FDB45638931B2C2D95AD5DF280499646136B9754D4AC3017D17A
          6A7160662DD11401260F0DFD5D37B5901A6E3129BE6531E8479485163021F2F9
          AAAC19EB5A8B39B8A37D88655ACB69419F690624B8AA7373E781C8E8ADACEF0C
          B5DED68D634CA6630F0B399AE623185B1DA4CB0FF8D8D4E938FBE3FED7849764
          BF90908D1C0B62A8D64E5DF402A94F811FC8A962D7A97CEE32EDE5D1EAF44415
          42033A7C9F501E3ACC8EDBAA4A5351609AAAA42360129878381E703DFF5AFC9A
          9691E57C80E8B828FB32198651226086202F064C3FCFFCAD0030C34A0EC0A4BE
          A6C112FAC500960B6066DA54029802723453E23B181E49C84A59B7310D6082A6
          A37840DFF62417A4BD1F521E0179B505AFC53B20FB7964B61865BA846CB8EB80
          39A4A3E308B4300FE5ADD59533C505253EC7F1FC3979310C1EC4E81660962D70
          F2E9348498685AE63D5A1F87A15472D0B2C95F24BD4B9E9595D3F0F8DA4C5909
          3E133C5C51152B748ACD9562EB52574E8F3156D59545C1CB9F912F5F96BC1669
          726E7C035298A7E42D9581710744BA1719D6E3F71770FF7046961B90FEF3AC7A
          686B81F65FE33E33904D0160E682527159A8C564B4462BD9F5A0812AA75A0092
          D3F10DD06F5A125A9592D63EAEEBDE14EEF6498E6F1853F07E95AB074C7452F8
          54F0B13374FD3FF0F788AC6F51A64F0021B3C0CADC2A600EED18FC65D336BFAF
          BB9786A6F84B8EF3517CFE8F5C11CB68575377015393462651C959B46C32522F
          06B4DA71BFEBB9CEF4DA163963EEE72A5CE7A6F2CEB8CF0D4EDDE345F1C47CBF
          32A6EC1A3059BCDB456BA7D4CAB765C4BA148A7289690A1B35FEF700C60948E1
          8329C374DD404B34C78458D501E62D00E57F69723906C0FC63CE47474178BF0B
          6688F9A720983B72BEA7317E9AD13B3994CB5B268CC7CF0526F4B613FADACA0A
          0434265722E20C003318BD0098379AB63555574B3036F9A5EB799FD6FAB89B81
          A992D46414B5DC6C8C9BFF475730E0EB7E8C9B3F5EFB9CD7AC4FC458A3C99513
          33925C8BB80720EE6BE538B1714C9781C9434BA7203299E29149DEFB326291E7
          896F2302CDDA3ECB34967634C2DDB83E59009864E44060CBF315E522C9F723DD
          B139DFC581793C047357669A01B016A7A6956D104F8516AF6035C6985D0B28DF
          4BA5E75DA27EEF3064C80228F078AD88B84AAE7BAE94FED5DAB985CAD7283083
          B1917E258F4F4FC2A07DAEEEF7A06B85EB7A07F29A7D7444AF5FBF4646332A64
          1573784692CB402F8D7383F1A5ACDE7E0560EE864703597DF7292D1890CD7AC8
          451974C8A05B550498B414466BCEBB6B0B313D14056677877E094C040F7A7B04
          78FA3DDF71E8D027C23346B44267676912144C6B4B4B1484025803C0247024ED
          2BCC08883BCAB65B684FA296473FDAA789EE2C5932BD5E2529DF4F1A63D2CE1B
          DAC5926593FB00F22EFBDDAD99F51B06461F63643C50009890C9F3E87F1C86FB
          BAD063401398FD0B98345B3B1F3C4D2460AE0230F7D08CE777BEF7DE18B4604B
          8A6446C56718A69A7A2E0ACCC089B3ABB727B23ACFE12DADAD4F23FE409DEF91
          FE3F5DC71B85882F541E1230134DF268A26019AE0FA5E6CFF91D10F22965C155
          F3B02B13C6332CCF3B447D58879469FBD79AB02B52B42B4BDF7EA0609E49812A
          E6494D60F6482809438CE2C386EEF01A1448D700DBEBDCB4E96300D7935DC951
          08004FCD0EEA015336E0B684967FD0957D06B175AD993A1DB564A2C661E52093
          2D0C68CFE833B8B2DC85FC18D7672B0955D9A8EE02602EC75DDB74300C18AF72
          32485FDB0560522540CA49B3B0D1EA7EB09E951DEADC7BE022EBAA539BC04C0F
          D0BFA550DDFB21E5E5BEEFBD8DA1CB4E78486E662669C43D9F80B90EC01CA229
          1089AEECA1E896E5CD9A2506112E08FB39C074C3677E86A99506737BB5B40E78
          0AF7EDF4E3B051C0CEB2F2DF82B68695C8C35E6DFD408022006755685B0E3039
          80A956BAC9305EED8289D63CC9F8FE1319F99132CF88120AEFB484B00AAC449B
          179AC0ACFD9EF3B3A03AB7A2BF570A96A8BCD0A84070FCFD7DF438BF94C3DFBC
          A2C0A431263998BAB72BD2344445BBD5C23063D1A2AD0A6A5737ABF6182042D3
          2FBD154C164F7F7FCBB697E88E31C34063ED4A6F80D3E2B3139854558741A0E7
          69D0B95B465ABFC45599BDEEEB16336ED9500979060654CE75C0E5D55EEC9AC0
          AC0E34D9B71754E7656A8458044CEA2D06AB0B6D68A19EC2CFE119692C073087
          AE0592DFAF230DAE14D525C3ED1FE9C92F4014193D93099848B0DC0974257D62
          C7E046F9BDC877FB1027F6E39669DEA78B66E4B1D9713C02E6CAAA52491E6392
          2D2E4DA4646D2F7B80C5267F985F07CCA75982E1794EE83A30233954F3527C77
          09EB1230C97DCC3F59BD0D7E6D2010D0FA5FDEF0634B07E6BE2C585F0EFC5791
          D9A461A8DE2205E8D31C54F66767A4F12A01F33900734FA61114301D77164036
          43E77B8A405389DC10AA3B28524CEA7C0D602A8622AF051AE34EF4B7A6999679
          6D01C389B7412329D78B55B47989CB25D40A53773ED5231FA7C921CE47B3D0FE
          5656B7983BA394A8E0FE458FBA7268608C59E634FEB2B780490600B4EF33CFE1
          AA0B2D3E32076814B61A60565C07C76CA1259B0A7DB831238D0D04CC3F019807
          30CD400BF1A58485F8A42000C8EE0366747635D35A36310DE306D3343F9FFB61
          1890C76A2F582EA9B268A259D914A3F9F9B4B93C2D3D50BA56C9353430503BAE
          2A745BE8D69C207D399455EC5B696C421303C7B1F4B04500B3A6D1D301E64F71
          9DA15108D4BC1C0EC57938E7CBAD0898A1C4AA556892E4EC9E8C343AF9D0C143
          7E639AC6B14C33A0F578D575BCFD20C1D7533F529E8665B00C0F0A4437005386
          2E1982DA5A96C192D276B65A96F9988EEF9F320DBEFF94E7BAD4C275563F4FAD
          086E011D596E393C61F031A0F0F1884E2F06702EA3DD255572234BA5D919696E
          01C0EC460F06554146137DE3A030F9B6B25B1330EB95F410B09BE517978039F8
          1AB42CE7B002C1759D93A154A95635B27CF846CF0033F0F69C3E5B4B1637B66D
          13E3DABEEAD113B8BBE4BA9FACA54E7544925BCC0BF1F8B2AC340D2166400615
          EF012CB6F5A71698815C2EC295754E4CFF04669507024D23F6AD0998F5E12016
          B7A14E48836C65BF80B1D875AC400028E6BBAE7B6CADBA1A21E8FC68EDAF8780
          A97CFE847E39699F5CEDC9012DB67D3D2A9BB38A1825809F6FBB9E5777A2595A
          1A5C1D7FA02C605203E87D1C249373B390485EDEBE5605CC8A4CB63D60D6B905
          E987C0ACDFE3770C78BC3F238D77F9E0F6F6032DCB5AC47991294FE6951C673C
          00BAB02C4E5A97080FD3E92D602AA9039855C5CAD8DEAD2D2D8BC97174017EC8
          01F489004A5D0157B69BD5850F80185AF2489D41245285611C87D8F7D218436D
          8E551BA4A309A53A596C5BC04CF4D5D30F81596138E291363FCCCB48E34D3EB8
          A36390659AE4C04ADB863234935B8AEB303AA92ACA938C0602DBD2F0410F0253
          ED58216305DAC01A393BC223DB30EEC298F9B822167C486F7DA7E3D2B8F9C584
          97E44325319E10C602D09EB90100607C065DFB8301CC0DB4717CEB0666B4A05C
          5587F78DCF1F7D60D2AC3801F3B1D4B47A0398BCE2CF111C9F03FAB38EF27899
          77B4B7D358E8E7E8FA1576ED8F71D9F5BEE79D4D634AEA96F50530C9408157EC
          6A2F360CE3D2A27CA0E57F0495CC112C695759C6D20CE8F8322A86EFE7A5CF85
          B81BA97C06C07C3B199865F3090251D6B8B5B78119333088BA633C38E3A3D872
          495F02D34711D22EA03F94D5321A56048ADAB3C00CCD4A83BDB4D17289BC0A79
          9F9B91C632E5250F0A3ED9B6AC9FB32E04CF75677B527E0DC0F4FA1298F87D01
          40398B752100943301CE2BD2DECBF417BB48E92F0739B9163CE4DFD534C56510
          CF8300E63B71604647F7410E3D0E4C5E3D6F7F03B24E0726E74B0CC1E9F436E5
          2E5446348BD08C486ADBCAF624304F80F0EECCFA189838153CDCEEC736DB8BF0
          9809E8ED21D0A7AC19D2C2C084B8F6404F690DC9C7535E1B823DC9CA1D0B932D
          745C08084975398ACF7F15BAAF64C35A6C9B766274C99B385ACEB900DE7900E6
          9A3E00E650B444970394DA6B96356173271DF520E59FD30B36BDD504A067A315
          D4DA901DD6D47F052B4F6224BE1ABFA99B450C0E428DBA13D822C7CC19206B0C
          989CD5897F36649F45BB07609E8371F20D64BFBC4501B3E25A640292C8F44080
          CF1E42C587E18DBF310E4CC0E543D0AB0BD1EB393D237A5160926B914BA0933F
          F63DF94A1C983C68362F86CE5C92492FE7DFE483DBDA95686841DE3053945B4A
          3A00682322A4DAD4D2095E6809FE0FC0FC2998FF472F00B303603C0D2C4F07BF
          5DDE63087AE73BAE3B9167358C5967849247005FD25A65E64146DD14BABBC5FC
          6FB0F6BD9C3CA1686201CA762914BB13297400387F4353836EB0A0C4FA10984A
          9746A180160574644881F32790D7BDE0771DA2A101E2A350AE87E055DEB6C0AE
          EE2EA175FEC590199DFFF226F21C0C560F05B747E4C5C5D07202EF880EAEE57C
          B46DDB7F4082556B7F207E1D1DB70700FC1D3501ED3F3CCB30CCE3C823626229
          4AB91A35D0AF512BDC23B95C0160BEDE8DC0DC41A823D3F924D4489F04AD5AA6
          8459C1719C93917FA6A7033F6726091C91154F6677AA9B4263C05487D954BD3C
          1265957D9C5D5290F22F00E6BE8C1B0E538714F72930A1F09264D0531563AFEE
          C7844EBF641A6224EF680F5715A0F79665DD83DA7162CDB70E5A942BD15DBB08
          02680540C60020866D99B722914CFF3100D4CBA14BC867D0DD459F5B29EF4B75
          9CA703F37D8630268326DAF7F861E43B02C01CDE6D12F7FDA737974A64ED9379
          2CB78E4B1374772F06382F2DBAA1BB6068BCC58C0193D32E19C9968166DD8DF2
          419072198039BAAF81192B97DBC1C329AC6742EF6E94E6EC0AC874261FD25E59
          8603A3634DCB4AF4950A257E18E38CCFA1EBF7024D1641249EDD62CF619A5B97
          2499BC79DE041634F155C14B5F2B6CB34D73AEA023E47B40DF4B4E698AEBCB5B
          1B71171705116CF1B9082DD03759B11D6A45C27A244D93065DF06010FE25EA48
          9B89B2B9BC10155B0A302BBC8C034D0FF6509DD87BCEB8387F0D9A43F6DA6B78
          FBC04A175BB9FCB0AC5FE23A390928E4B00A5D3F3A669B530B670873BA6599D3
          35F224EF008733724992D0FAD096B0544FD88CEDD93260C09F78C1735572A5ED
          FB8B36979CB12CE530A16A81E5A7A78E1FF095BD272D1ECF96DDE35BA7860E7E
          3386EC643ED9C90AFBFCA908B4869FED502EF351DC876913B28500339ACD0A17
          22AE41AFAE90696942205DA81DA2E90293BE7B13D70E5DCD1C3A740A70A55C71
          C6CFC70CE5C2F7B62DEB312841A23F1A80E876C7F34E453FF85C28623B17E223
          A6619C9C9521E22C703DF7988C33403227585051DC123AEDED9620E92021C719
          872EF4A3DD9566044CAA60C8AD09BADCD300FE29604BDBC37D4A7817692D4037
          FE0650BEC08B768D57DC573EC7327D07F14BF04FD5DA2EAFD9158986672790FD
          431DB717A1005786634C370426550E597B53C9CAE553754F93819967AE468176
          F53C10111F1CCBCA5B41FF5500E75945052CB878145DFC2B7D4F5E8C124CDACA
          17F72B7B7439EFBA74F858C8F668A8C19741CBF6BAF9435FDE42DCE992364644
          4766B4B7D55BAE19424C0738BF93862328F54428E183E4798D0EB4310CF342C3
          10A313336574688F7B31BA78A9162D7ECE790150FA29966DDF5254E0C942509B
          BDBF5BF2DCE985FA9B39CD660D30192A2EEAA2EF04811F8DEEFF78BCA3837F68
          437ADE1ECC4EE4B40E151EED727F08492D4097ED99E874A332308360E33DBAA2
          0A1475E6496A2B01976400F178ED8BF8B9A2C1E2871A7D9E8618679072229BA4
          1E0A2D9EFF0379A2E5E6DF8892C27511007148220D81A927C680CAD54A4D48EC
          257D10A4CC668162D7F91BE27432B650BB70CA565ACA7951583EE06B122AC4A9
          E18C6BDA30CBC1776B50E12D44DCDBA0EF0F917D17789882B893637C10EDEB21
          7FEA15AE318299B35D3DCFFF2ED28FBB1EC52BBE0ACC9E072D284196FB20AD53
          99B29A9223C07B5299FB90CD1B20F837A0E52A90FF4C50B41130072554B6A805
          D14ADD8DDC8E49E28A6C644BA5D29110452BC6A477BAAE3B07B5CE2E86697E0E
          19FC6BE8899AE6D25F919EF75BD7F3C9FCE82596117240722880B950EDBB6E30
          9023B1CE52692C53EEFF0B84AE01531DE2ABBAEA281C3CDF2D744732141F0E96
          4C0C0A93A6BEFC5B28D075C8E525A4F512346D1D6AF060FD4B448B3975C00C77
          C8A7CB549542E2BB3A60C67919EE7B1E1DA3304C4A9F68945C186FB3000C5040
          F6563C55C15874C05082D882E639B147C4D32A639E7E4890CAB0DE0B460C9801
          379CEF0A9A3E0CFA77C69F43F16400677448307F15C381E705E37F4663B2C1F3
          A572791379D2F0EADDC894C7E52130C3CDF3D5F429DB6D9AF50EF70D933C4093
          85B82390E69ED2F768A2D408642236E19FD5C8FF59A4F37AB458510DCCB6645B
          6F30361CE87C840E834D78ED40B98F42E13D8ACCDBE8A837D330CFA39E3194F0
          56D334A6E0BE10B5BE8FF727944A2ED5709B524A010CE4FAEBFF37BBB57549D1
          E3F56A03B9A8C460777CDA59988D040D6096D760036268DBB408651DFDCDCBC7
          E591F2F52130834387D50E182F342933AA12DE0A8019D8254B4F194204B20D0C
          24C82E82CC0BC876B9878119787DC4F74A8ED1963F92250FF2F7C3F2D40666E0
          DB908FB35B6CB2F3ACF3348796E78992EB4E40CAEB824CF8FE509056D775165B
          967DB5E77B7720FE1A1036C6F17D724C556229414899B6E7310AFB02988F3502
          4C49034BD79D025A7EDA1353A64D603681D92BC00C3806D186F11974576FE209
          9B8E01CE3F3AAE3715EF562AA705E1116FC42C11CA431DF279F681403D0DCCF0
          688719A077569EB140574313984D60F61E3043333814D434D3347FC013D637C9
          32080AFF435CF370AD344D6B53A9E430DBB6A8704D90340C59BD8BEF52C774BC
          87818996F2628CECD5E4531398D1BB2630B76A6092CB4819AC159D6999E61C30
          9C668AB799CCF1E89871D7F568EFE1768835141177C318F30CBC4B3534E632ED
          D8EF72E8323001CAAF83F9CB22C56802337AD704E6560F4C16198E337582D675
          603A7311B54A011939897626E1EFD483887A0298C86F232A88F3A5F4AF63317A
          9AC08CDE3581D97F8019ECF4D91F2DE78D283C6DCFDB00E644C4BF2FED7D7703
          1379BDE8B8EE5400A56CB6D50466EDBB2630FB153003D6781B98F9B6611A6773
          0D0BEFDE042640701BAE0B40EE2B3CB601B109CCDA774D60F63B600A95B14733
          B6C7019CDF4241EE9B9148AF00138078D1F5FD4B71FF89FA3BDA61D60466CABB
          2630FB253095021ACA55FE4000742A323937C51881809979109106303F1A02B3
          EA5C7BAE14C27FC3F3FDEB21AC1FE0C1BA32E54D603681B92D03B32C2E2E8719
          DCF80C0AF50CAE36335742A9E41C81F80FB3CC9009980FD9B6FDE7F8266EA4F7
          0240F933D7716EC6F397A3D3C32AEF9BC06C0273EB05E6FF03F6366989DBF715
          560000000049454E44AE426082}
      end
      object LblEmail: TLabel
        Left = 3
        Top = 139
        Width = 36
        Height = 16
        Caption = 'Email:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblName: TLabel
        Left = 3
        Top = 87
        Width = 38
        Height = 16
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object TxtEmail: TEdit
        Left = 3
        Top = 109
        Width = 232
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = ConfigChange
      end
      object TxtUserName: TEdit
        Left = 3
        Top = 161
        Width = 232
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = ConfigChange
      end
    end
    object TabSistema: TTabSheet
      Caption = 'Sistema'
      ImageIndex = 1
      DesignSize = (
        241
        269)
      object BtnGitBin: TSpeedButton
        Left = 211
        Top = 25
        Width = 27
        Height = 24
        Cursor = crHandPoint
        Action = ActGitBin
        Anchors = [akTop]
        ParentShowHint = False
        ShowHint = True
      end
      object LblPath: TLabel
        Left = 3
        Top = 3
        Width = 72
        Height = 16
        Caption = 'Pasta Git\Bin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object TxtGitBin: TEdit
        Left = 3
        Top = 25
        Width = 208
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = ConfigChange
      end
    end
    object Opções: TTabSheet
      Caption = 'Op'#231#245'es'
      ImageIndex = 2
      object CheckCloseCmd: TCheckBox
        Left = 3
        Top = 3
        Width = 234
        Height = 17
        Caption = 'Fechar prompt de comando autom'#225'ticamente'
        TabOrder = 0
        OnClick = ConfigChange
      end
      object CheckCloseStatus: TCheckBox
        Left = 16
        Top = 26
        Width = 222
        Height = 17
        Caption = 'Incluir prompt de git status'
        TabOrder = 1
        OnClick = ConfigChange
      end
    end
  end
  object Actions: TActionList
    Images = Images
    Left = 56
    Top = 248
    object ActSave: TAction
      Caption = 'Salvar (Ctrl + S)'
      Enabled = False
      ShortCut = 16467
      OnExecute = ActSaveExecute
    end
    object ActCancel: TAction
      Caption = 'Cancelar (Esc)'
      OnExecute = ActCancelExecute
    end
    object ActEsc: TAction
      ShortCut = 27
      OnExecute = ActEscExecute
    end
    object ActGitBin: TAction
      ImageIndex = 0
      OnExecute = ActGitBinExecute
    end
  end
  object Images: TImageList
    BlendColor = clWhite
    BkColor = clWhite
    Left = 104
    Top = 248
    Bitmap = {
      494C010101000800200110001000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000006500000088000000880000
      0088000000880000008800000088000000880000008800000088000000880000
      0088000000820000001100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000A800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000001C0000007600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000F30000000E000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000009000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000BA00000061000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000005D00000033000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008800000091000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000B00000084000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008800000075000000200000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000008D000000050000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000880000001A000000760000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000450000004B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008800000000000000910000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000020000008C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000088000000000000005B0000
      0063000000440000004400000044000000440000004400000044000000440000
      0044000000440000004400000044000000A40000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008800000000000000030000
      003F000000440000004400000044000000440000004400000044000000440000
      0044000000440000005D0000008F0000002A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000002200000065000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008800000000000000000000
      000000000000000000000000006D000000890000008800000088000000880000
      0088000000880000008B00000022000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008B00000000000000000000
      0000000000000000003400000074000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000006300000088000000880000
      0088000000880000007C00000002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object OpenFile: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 8
    Top = 248
  end
end
