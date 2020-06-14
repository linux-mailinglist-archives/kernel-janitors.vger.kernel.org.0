Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E376A1F87A5
	for <lists+kernel-janitors@lfdr.de>; Sun, 14 Jun 2020 10:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgFNI0A (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 14 Jun 2020 04:26:00 -0400
Received: from mout.web.de ([212.227.17.12]:40159 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725265AbgFNIZ7 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 14 Jun 2020 04:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1592123143;
        bh=wxTFjGGrH+o7SM0GZXIuMetiHFRN0FqP7XJd2HJ5iNk=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=Jl+8vUIRKYn+caXq3AsvT1oUg1jYXwQAnTQJrnjIYTZ7++mwFwCsgD61fhJ24Z4Tm
         nYOKOxgfmLQoo4K4IhQMhez5ylJylWosAmKQBIQY3ufxVCdlvNP9atThwlyEyvDSgK
         bhboCJSOaIeX/WG0mIj2ybBUnM47MiOliCP83UuY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.103.145]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mdf8F-1jAm5n3HDl-00ZW3I; Sun, 14
 Jun 2020 10:25:42 +0200
Cc:     Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Stephen McCamant <mccamant@cs.umn.edu>,
        Qiushi Wu <wu000273@umn.edu>,
        "David S. Miller" <davem@davemloft.net>,
        Fugang Duan <fugang.duan@nxp.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: fec: fix ref count leaking when pm_runtime_get_sync
 fails
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To:     Navid Emamdoost <navid.emamdoost@gmail.com>, netdev@vger.kernel.org
Message-ID: <38dcaa5d-98ad-e1df-6e83-2e6dd677a483@web.de>
Date:   Sun, 14 Jun 2020 10:25:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7JWjazx6Gvzi2ymxy+2LPOQa0z8Dej9yXLglMl9obS7g2gPBEPR
 S6hV4uat1fQDm/HTsoxZI/QIJc1IXUCZ2IrpwR6BP0llJHeb5ctscDntvK0ifgBg8mb4oEF
 SbVS8IjqoASxOfrPoOTGYeVJzzw5ckBfhNbyUxy0B6kidlLnbCBEtnhhxIck4z/kDT9hVKz
 dnjLUEbNewhqoIc1BcdWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5KI8mUZQ6I4=:XxjMcKaIpU9m0d5pHrGTAA
 Cr7KoCBpS1SdPd5P4MHMH+YA7IFlplOtTbi/VWnSlHoek0uvu/7enSpMvR6935WxVPdJymFZU
 F5rtNagT6AvYJKT6ajgYCho1+Q86GF5hQdIbKYKowtUvaKmxEvj2RX+Ket3Sz8aNCvJLHvd6R
 kKZx7I7gLZmC4nZNktSZs5+n7erCAVoPs8P6u35RtfLExy/zSIzoGcWQNzq5zS4BYEq8F8dDT
 hBasCv/xUm+onUW/6q4FEmvDKcqoOgjxOYO/u+X9y5EyVPl0Lstw1yCPAWXmt0qNvAZ3G+/Nr
 k8tWpaqEoIhHwnJb0jVp6z1DrqroH+UHlU0KeP/Uz42vqADL7lPfQEd/DI0iU8Vm0oefiZGEa
 tPfKPAOvwSvKvabkebsOxNGbiOWiRoR6W5Jd8acjiROqfQzYymvXXGvY0MaL0FRizihkLbUGr
 JeAMSbbJF86xdnQnL1eQAE+b79RQEatUBOoFLLYLlvCC3pg8D4i6JEI2dPjYZ++1vHJDaB/Y9
 EmkDssC9Og5S+aUKvpoV9/hEFdMi9HBNjZ+DPBX9y0HftA+Zt2ysWqhL6sLsYYZaqEDyvCA77
 Kpt8HccmYcWHMP0UPYTJqTUf4sOaI0ZidQ4KHriOEIXnyxOwUR3pdVLqQ6G0sQc7rExzjSSy1
 j5Ys3VWHsKf6XDYmNUKAMzDTQi0uKyRo8L78TBjXfTQe9zJr4jmk6XLeiYY47BRPSE1ov2BuE
 3RtY5rlk/q33oOKcqSQem4ONwubp4QWwcCoV+lh+0W3ZSNp/FU7YtoMql/wWl0pPegTpa5sOC
 pGY097zzsRVcmQyFR/SiRqPMn6x5P/VjEJyleawEHv0KZkILUzzt6djyXaYdiUH5ZDu2j0Q6Y
 l7yDz5KiiZ7fps14gt6YBGVtWYhiCXE0eCV4ysv9AOu9Rr7YainF9L9SDA/yfFLjZoGM/yewx
 qDs6CILE0M0lpoQK8Yoe5AaAMFoyV+OgGcRVw1vvU5MMthDuCC9YNuCzd8FauxNcTlKl1KvuW
 AaX17KTZ2mUinQMVe7q1mjX5wvHtrN9W1c53GSrI24F6StfyleV1TRIF+F9TfnKkTzqFrpoTj
 djXALIHLbE3ZgP+IgVI4jdKkfdQ3ABFAUHEGR74nKS2Dy5G1afjS3lfsvY+8VNeZPAdE+49Fu
 3uxkGrkrEqbu6fflmz6vgpy5R7/X29K+N9cbFqKhuWbD2SWBy4/gbI+gbyNFMzdgss1KI07Aq
 5nIarzJipuo5vGQPs
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> in fec_enet_mdio_read, =E2=80=A6

I am curious under which circumstances you would like to improve
such commit messages.

* Will the tag =E2=80=9CFixes=E2=80=9D become helpful?

* Which source code analysis tools did trigger to send
  update suggestions according to 16 similar issues for today?


=E2=80=A6
> +++ b/drivers/net/ethernet/freescale/fec_main.c
=E2=80=A6
> @@ -1893,8 +1895,10 @@  static int fec_enet_mdio_write(struct mii_bus *b=
us, int mii_id, int regnum,
>  	bool is_c45 =3D !!(regnum & MII_ADDR_C45);
>
>  	ret =3D pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_autosuspend(dev);
>  		return ret;
> +	}
>  	else
>  		ret =3D 0;

I suggest to adjust also the source code from the else branch.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?id=3D96144c58abe7ff767e754b5b80995f7b=
8846d49b#n196


=E2=80=A6
> @@ -2276,6 +2280,7 @@  static void fec_enet_get_regs(struct net_device *=
ndev,
>  	}
>
>  	pm_runtime_mark_last_busy(dev);
> +out:
>  	pm_runtime_put_autosuspend(dev);
>  }

Perhaps use the label =E2=80=9Cput_runtime=E2=80=9D instead?

Regards,
Markus
