Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C06DEE7725
	for <lists+kernel-janitors@lfdr.de>; Mon, 28 Oct 2019 18:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403957AbfJ1RAW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 28 Oct 2019 13:00:22 -0400
Received: from mout.web.de ([212.227.17.12]:48913 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730463AbfJ1RAW (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Oct 2019 13:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1572282014;
        bh=5rIzfzjhnJLXwlwwiGj+ZvGzy+C2KIlE4d0q97AnGVg=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=QHeDw7ES0tDoO0nAEDyl0SATl61nzRBFG8GnLlWuvMoNpUXo+0b8qTuPzxcrEAWiG
         asoP8ETMDlnWjTRYxKmS0KEggg/AieWnyYYoEoyOnRODTHfjVpMuiklxoC2tZATD7q
         zyrDg6NMCwdrBAL+qgKksDOQ/Q+D7oLk2i1IEKQ0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.155.234]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MFcE5-1iAZeV0du9-00EfDa; Mon, 28
 Oct 2019 18:00:14 +0100
To:     Linus Walleij <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: drm/mcde: Reconsider duplicate statement in mcde_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <9332a4c9-66c3-b57b-036b-a20b0e821334@web.de>
Date:   Mon, 28 Oct 2019 18:00:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ehotAqBcgX7fk2D8LPOr4iAIYKsefkFSvBfJQGUWDwDlIGXfI9L
 9Ai5mVdd01Xa8e1WeNtAjIULTiWqSR9Ma2CShyHFL1UsQdZI6BT99aWtghkav4cIlKQeVPQ
 /4vqrzbG6/82Ddb5t+x+DQXhgUmgzSR77mC3IhRrC3Y21rIlGuIPGzF98PSONF5RRpkn/2j
 BmtBzoedLElBToj9ob2Iw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fntq3CuIQXk=:qo1vgOBseRrNvBIF0joQKe
 QsHexXA9LjpNayJIAKfcstV0DaLGz3mhaUh5ij4IktFhjI+rpYRUDxKqqf/mOdbcuI4Kwwaa2
 j1Vx+NBtC6l7fI1OoLDYFVh0amdydHKP8o0H1IJ+F2uP8d4Dov190TcLnMYZ0Zctm/Y9kek3j
 Bc6tmUYUZIfZyNFIqEs+gITg3SLVkJHKvK0OF7lnunQfhuPphG2XU155wh6zxB86BrymFOK0R
 bAD8//ooWyiExmBya6giXpml3+kZiakFlS0yEupRGhfsGgKtHbVU+jEcVW1/uBwy5NO6cNBuS
 AXsZtSbLFbx3JckyJK8CZudgpHLnqnms/qtgn1JU0yixrqRP0CZkqSHwctwq9THaW8tQBDxxA
 4rkVAtEFYJVRV2krhBIp7PNuakwUXaXk/5mgsQ5O4lB8tAgYm87ubPSux1JSOnHgbio4q1AH7
 9dMN4nrAksVMkXwltYSx/B9TPySoqw2R5GbT+UXXvn7zj2erk0vlLiwH8SapyAmG0WLhSU0fd
 cf+CLAOBnlz0tdXoUAIe38dgAW528R5Hk74QvtCxH9Cd1GwVOedS/pdcED2agGTm+SGibOQQr
 4H3w4Ygi486Q9sRp+EAJVSPlqRLnYtoySn0VVB0M8ddjdapMCCEf9HJeeFRpLWe/Hmw+1BOC3
 jmhY0AdrLlojYQDO4Ndg1sffADwBYVATKEdT9CnR3jnV6h3yBZHEXu2jPsbfa4Whethwl+G5v
 Xyy67/KNbX/Z9oClGY3rLUFYeIoTajK69eyepuCv1XY7X3Oe1TbE/9Dmly/h3klTfDPLUMi46
 zXEwT4BYN13kxYhoHoDoJDLx5G5ayyPeUVNNgeBLKvvWuXWmwPgiTLNTnlZen8iTNDNylszZF
 NlGbJlcSQUC9ov4rTRcy1FQ3HRNgPNjQZuywltbhTBmmzEohNZw7bJ3xnM6LUiwE6+FcuPxaQ
 dpnk3YmyfHxPzfp3Vxm3CUeU4ZKmmmHO7CusAbfEThCnNj7joCr0q7VHEbZm08gy7r9aCzdNU
 /9YN4OLf3CEeDofqiWPNVOSgXPSl5P3f4VWV3vuYTyGXQf0xdQzWvkAf6KOI3g1kXGGdVSqCu
 M6OvLt3UGVpnHbTbqo0cOD6SBlMD1RoDfyAtVQGckxKp6otdfvEpkWE9O3p9QNiVZYix5xZbo
 bPhw/Y4Q9MAfNpTFlLK7By+FaDmvxcyBN+nBBeUfrpWAX7uqbDpsTnKzdqtI5BDTmWGkqOqiU
 kxS9A7Hah5kWWZWsQDXyf+8rmQRmKZaWPpthSj1p2AEa5qoY+Kr/PLckZg6c=
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello,

I have taken another look also at the implementation of the function =E2=
=80=9Cmcde_probe=E2=80=9D.
Now I wonder why the statement =E2=80=9Cdrm->dev_private =3D mcde;=E2=80=
=9D was specified twice there.
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/gpu/drm/mcde/mcde=
_drv.c#L339
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/gpu/drm/mcde/mcde_drv.c?id=3D0365fb6baeb1ebefbbdad9e3f48bab9b3ccb8df=
3#n339

How do you think about to delete one of them so that a duplicate assignmen=
t
can be avoided?

Regards,
Markus
