Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 500B94E2F9
	for <lists+kernel-janitors@lfdr.de>; Fri, 21 Jun 2019 11:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbfFUJQP (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 21 Jun 2019 05:16:15 -0400
Received: from mout.web.de ([217.72.192.78]:38775 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726210AbfFUJQO (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jun 2019 05:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561108541;
        bh=ilUtmFA+0J+AjoNoXtJ0NP4uwPoKJNaN+ECoIPbIa5U=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=i5ADZggLXzAkg/KSD/IILIG+QGyCgEh8FIR98SGo6c2XuL0+Fvsh/i16IQdR/LdeR
         6rdp9wkDeQPY4NlKC/p4xOj+hBZhGgiBvlj/owHc9PfEbhsBKuCcpLvCQ9qyUJE/8D
         npfrSpKIdmAw2zNVSBNXLDWMq60xU9zkwwYeUmUg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.156.129]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LxfGh-1ignZu06KB-017IAX; Fri, 21
 Jun 2019 11:15:41 +0200
Subject: Re: Coccinelle: Add a SmPL script for the reconsideration of
 redundant dev_err() calls
To:     Julia Lawall <julia.lawall@lip6.fr>,
        kernel-janitors@vger.kernel.org
Cc:     Gilles Muller <Gilles.Muller@lip6.fr>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Coccinelle <cocci@systeme.lip6.fr>,
        LKML <linux-kernel@vger.kernel.org>,
        Ding Xiang <dingxiang@cmss.chinamobile.com>
References: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
 <alpine.DEB.2.21.1906202046550.3087@hadrien>
 <34d528db-5582-5fe2-caeb-89bcb07a1d30@web.de>
 <alpine.DEB.2.21.1906202110310.3087@hadrien>
From:   Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <13890878-9e5f-f297-7f7c-bcc1212d83b7@web.de>
Date:   Fri, 21 Jun 2019 11:15:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906202110310.3087@hadrien>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NzVn5oeUAefREfJ9BsmN+lSXeoxZ0nYOXhCg4JUcHRq4kowfFaA
 jnHYtVkJ41FaSBuZwMH+lKIXRVQJm6oFnlX2xlL78XjfjID0M7MpE3dv07DlJdKTahIE/LH
 2JEYx0lKG2JxLjmu3skpqBq1UYzy0PwtOkaz/3Vy6QNOQXA11j/EOm1UqFopIJ+R26IF4Ep
 qVOUESC4DOa2yf446KuOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kJe6KNIX7IE=:G/XeKtPXJ1MfoJo0D/cAg1
 2rIRicGc1XcC8nXhB+CNDS42My7N1ObfdFkFYYR6s98UqYOXIEWS95c/FYsSFEVGz96eKyFr4
 YATrc91fRDiDbcaTvRwr5mXv5+Gct8XnhDoxhIR5U0lOZP1QCX5HezL328UoSHXmHn1Y1zbOg
 Mt/PhnvsciZQSR4Gn1xXMbFfjfheLSOzhLoakd9d4kU6x3IouJe9Y9rQqiHJwmWstTaVITASn
 87q0xpzMWRKZr6hrDv+USuNHAkIqupopu29p5x4GGrvZeDYlSDRqafT1chdUjUCZy6lGpmaJB
 DVEAfJGkLdaoBrF7Fx0/GLOpU490azNYorIeo/XPl58R2yRBfnnmIWAuvATzqyetgGbsPJMAk
 d6UbmmjielyCN5SpsAqWQ7AyuZzWbQxoQef/EDskocwPYOrbYNa0Ma+i5fAhLXEZ9fxqwZnr/
 u81TsvEENrnkZU39eQD5af8XLJoETzrVzPeBiImJ5SvxnqrPki0XQxeAoz3GbgILHfz7ofooZ
 gIb83ykQY+ZHuWr9BlA1DgOzB77krruavV5oT+it1+2fEU2odHAS2b+NpbVKKlqx53KD7uXmQ
 mCf/TZdLZ80yuSBvutPH+g8CpUpLpj9gbocIv1rYhkupNSdsDJsMkcoIsfmY855RGA9iTdjcS
 fS0rOETgftlPfdL6PUWfSbwiIL8Kg6D/TWugmzVeiHe4xFHubbuxPhEq33o1Ynhl0k0e4UxXf
 ce7+7wTcn2UxMe0UxF28ab+NMMyNFocKrvr0xNWMtJZZvO4Z4ZjjB60Qc+VrjiGbusCMfnej2
 1Zcc4iF5hxN2I2BFa+vPlHAqY9YuLtjwL7W4NHUevNlw3UWiTv5yjlYXv56mTuPOQ4yE+P+Cm
 Lul90xjT/nJey+ut8T9tPsEkGWF2iDEs3aGy9pmw5k14Fus5kbqcR77oGvitnXUi1GDOFdG+K
 2e/o4CDTv0110+BIOa3xfy/XxHjobDfCh5Sr9yZQ1RQUnrrR0XYCP
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> I think that something like
>
> if (IS_ERR(e))
> {
> <+...
> *dev_err(...)
> ...+>
> }
>
> would be more appropriate.  Whether there is a return or not doesn't
> really matter.

Do you find the following SmPL change specification useful and acceptable?


@deletion depends on patch@
expression e;
@@
 e =3D devm_ioremap_resource(...);
 if (IS_ERR(e))
(
-{
-   dev_err(...);
    return (...);
-}
|{
 <+...
-   dev_err(...);
 ...+>
 }
)


Would this approach need a version check for the Coccinelle software?

Regards,
Markus
