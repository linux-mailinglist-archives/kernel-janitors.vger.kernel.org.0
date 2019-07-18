Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CEFF6CC67
	for <lists+kernel-janitors@lfdr.de>; Thu, 18 Jul 2019 11:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfGRJ5Z (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 18 Jul 2019 05:57:25 -0400
Received: from mout.web.de ([212.227.17.11]:55491 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726383AbfGRJ5Z (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Jul 2019 05:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1563443780;
        bh=TgYOjUhDBEP1juVeE/AiHjQJY6XMoYGl3kH+EftdEj0=;
        h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
        b=pks6e7p+ConDTX+soo38ISz0y9LJMrQCZyQM326PvDI8VfJSFAjuWwIzD4a716/jl
         k2b+rSkcx+EShd5GH2F4hvxWz+o0jjYBNAnu9ligWcWQseS71VQbIr8vY2oZ5Jo4iJ
         yFIIxuCU2ZcXcsBy3ZrPLo21dwT0aitanWt2MOnA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.59.79]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MN4Oy-1hlsMN3Vyi-006iYK; Thu, 18
 Jul 2019 11:56:19 +0200
To:     alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Takashi Iwai <tiwai@suse.com>, Wen Yang <wen.yang99@zte.com.cn>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] ASoC: samsung: odroid: Use common code in
 odroid_audio_probe()
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Message-ID: <c4c10934-f06f-24a8-1162-b023e4ab4066@web.de>
Date:   Thu, 18 Jul 2019 11:55:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x1N9WkizngMMedlvA+2H9oFOxXnJ6uwcd1/0TQwNrZ9rwFMiCjD
 m0NbUIc3OeH405Jcoski7NgLD5QaQrdzpKFtdHWgIRLlMHPFjIaUMNwPrmTEoa3eOZGQtL6
 4cMYXPxZqaReWb7evJC7qyY447r6SLefnQ/TcYfk6ZK7pY3eRD6Of1wy2btbRY3QL+5NaKj
 xkWsXlwNnqaSKtXC0s3vQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DGYQBBR74xE=:4I1tkhejdpu5SkpnlkxDqH
 cNp2jZnUp9LDEkBkjh1S1XCbYE6MliY0N4EDyR/ZLbLHXKrvR9QdWzF0hK6LirmlMF1D75hJp
 5eTDsETJDxwn5hXMzcemY96FkBkxRZoCSpyTTmH3ijYCciUNFdFDOxoGz900+FCt7Q3eexIvm
 ala7DfMnnw6AqyNQdaHSqddCeZljX3hm8S4wf9wbsZbZkuLgi/ZXMPzuKQ4w0nkfKQtEtQJsp
 nnTwDIXifBHIeA4yjkBgmN+IfrYeLqTQpHy2zF4Z6GGax9DMg9Tb5oAt5RS42t71FsevEKwxS
 lMvfR9qN6DSDjuFZYJ4PthB/t+amuUqeyRGRQ3eJVHMDDiH7KJYTN2UxMN4w646WT+/wt1Q/x
 5Usd/hkMJdMEcNjoOU+DI2qOihLc6uIiZVFiQZYFceuuI7uv6fP9dtfrxMfUjp9ds9L0qqKEe
 7ilFULllosR40BSKFr4PdVgCKcZez09EQ9eOme4nlVMmjrlXUgj1fX/oIX2SICyi9LH/16HUt
 iER6aq1HPQpEsbfkK9XsREEt3b/gBxkHfN7k1VyzR40ltKGIFxVz25b93tFNeHhoGImBtF44E
 cSQkozGWyPlIRInfCOgwJDjA6W13V23A8UuU+DnSXneqjpupTJ0Cs8MqcQw+unEez60gOGjmW
 MF+6ndOWrlckFYGWoUTAxsE/k55z6pmBZhEEpnYc7EpPJcY5W8x8HlC5p/MtrQRLXNRLMsz0Q
 IAv/+S1Fe/pd6tN+GB/HdbkgZV0x7jJ9CPBq9D8mBK1l8q7lxiWdBLU2bt3mNHqn/g3bOUp4Q
 XDZ7ZyVEoNPvhAxGvM+OQ91eIQ/AdqRWCwh3IVPYiAr+ITbrBdPyW/zCm+6nK/vMi/o+mwQlm
 GgI8C9og8J1cAXFZcg92pq23kuZ2wpD83k3RJrKfoAfoeGfNciDojAALES5qAeb9Eax2W/AYl
 4g6aQeTBAV8LGotbEghT/5MBFXgcyi8TQAOwmnXP3lBt6vfM/ey6tMq7cHzM9qBtUiVPTzv64
 Pzgd6rDcjttEe4OUrR/fCGQ0oQ1zSJKrWhFEp0lYraKPD3sMwBCfHzfrZoJO5aaKWehf3nQ4u
 wT0rpJwWDjNVc+PIPzctBenM0UhB9n6HJw8
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jul 2019 11:42:29 +0200

Replace a function call and a return statement by a goto statement so that
a bit of common code will be reused at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 sound/soc/samsung/odroid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index f0f5fa9c27d3..d152ef8dfea3 100644
=2D-- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -316,8 +316,7 @@ static int odroid_audio_probe(struct platform_device *=
pdev)
 	}

 	of_node_put(cpu_dai);
-	of_node_put(codec);
-	return 0;
+	goto err_put_node;

 err_put_clk_i2s:
 	clk_put(priv->clk_i2s_bus);
=2D-
2.22.0

