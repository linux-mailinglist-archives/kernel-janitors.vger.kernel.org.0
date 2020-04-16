Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4076B1ABD35
	for <lists+kernel-janitors@lfdr.de>; Thu, 16 Apr 2020 11:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504076AbgDPJr2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 16 Apr 2020 05:47:28 -0400
Received: from mout.web.de ([212.227.17.11]:53001 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503681AbgDPJrX (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Apr 2020 05:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1587030407;
        bh=W6Q51/NlWIpeKBgEWUnDBil03bI8pW/k0GwiuNlbhNU=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=TUA+uAkn0e/+fOsgBqkkIXdT+rMNx8IN4SXpK7w3krrAgC28nsnZkPLPgJsjn3XIK
         cx42ktABJjq7fDgRYaMBqPqj17SB8mObAZfP8LeTs7pbP5WCfobMx7CD5d0ibmLbkF
         YsWc2NA6YSjuY8FyRRT10rWi/HFHWLoGRWrF71Ak=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([2.243.109.113]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MA5v3-1jVqbm1nIH-00BHVN; Thu, 16
 Apr 2020 11:46:47 +0200
Subject: Re: i2c: img-scb: remove duplicate dev_err()
From:   Markus Elfring <Markus.Elfring@web.de>
To:     Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Allison Randal <allison@lohutok.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        Shah Nehal-Bakulchandra <Nehal-bakulchandra.Shah@amd.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wolfram Sang <wsa@the-dreams.de>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Robert Richter <rrichter@marvell.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Barry Song <baohua@kernel.org>, kernel-janitors@vger.kernel.org
References: <08564c03-3bbd-5518-1a9d-a40b8ca09f48@web.de>
 <20200415025426.GB14300@nuc8i5> <b5db65f5-f236-9e22-98df-07629a827738@web.de>
 <20200415152115.GA17519@nuc8i5> <668fe4da-56f2-8abe-1113-fa180f307524@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <73cc5a7c-787c-b263-7679-0f1fa58a70f8@web.de>
Date:   Thu, 16 Apr 2020 11:46:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <668fe4da-56f2-8abe-1113-fa180f307524@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AiYgFY9UTSVKOEH/5tKx1okowyBy10eZO96km7yW3j3VhiI7TBT
 z2MpcOfq278PqIDVlV8nHwYEn1WkholtN/7lPl9jeOrshsqBjP+IsIE8SeG5uUZnaATD7BV
 5F03JJWZzHWJHK6/i0wb2F7NOA7t7RxUhg2OExSrSiT4G1w3DWl4V5y2cuwD7w96oz4ymx5
 Kic5NB6DDd7miIsd84spA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dUphwKjnKnc=:C3s07ABfGQ/id+upkfhxfG
 fSuDnBJZoHpZbg3/s5PpN1NS7+G/uDzN7h1YZm1KcjYd5I0A/Vy/h4PDo+19eBNaHydABsx8o
 qKFiTFScV7OhCErJ53zEd0F8ZW3i/C+IGSyI39HyakqlOZzwFUNRSKi9Pk9lnA7hKJ8Ei/h+L
 r1wunarL0KiRKOLeYns75LDpOXc3SzT4Il0aaDrZBZikVT/U/q4l0BQvgTmqrY0K3WXdmzpz+
 W9u0GEP8vXZd3Hv62PTBEOJ2L3du/YG+MMrhTIYsWLZ8xC8g43B2Etorz4SjczCGuw2TydKSJ
 TEy4KJdGplxDtIC191d7zDiNz/Y+SJt4YfMHmUfBU5HrZFMf7TSbfEKZ4wcHhN2+3zN/1QhIF
 oJepdF4Zkldkrs5Rjebi/zkrI2jMbH8CWqP4Qkzg5BFGQM28QRqlPRq+2vkPf9EmxT3oqdjJz
 oAMYMTpSiDRFDJJtOoz8dMvVoqhc/AovrAvoKbhKf18o2VHQAMnudnb/x/4KL7dSJjSaG+ZqB
 xBJHPKyBlqXMoecmN5pfYxF70gr/JuBTHi8o9938S0QPGcJJNGRNNX6b/g4n5uN4SoJQvJsxj
 wIOXhg/VChjdnFGHn+4Pxnrgju1QuZu+r8Aq03YG49Yo8DzBD2JTDRiusGCdx5om9gDro80m0
 zZxZU6BGlzXlATVcq6w0njxo0YBXiT0M5Fll6RqWOxRv2hOI0aVwsKkjmbJVfu1Toi7Zzj4Ws
 iavUw4LNJzwcSls/QwyzgLfIy1dRIf6LdJJ+zrq0BLUlxgfVGCk/3hXLx/d87vtBJPGsr0/z7
 Ov4schpOURWmTn+UTViC3JbyLcTdz9HL1CZJ6u93N+eYpZHAARdzz0IYtMDo58wjZsZvqohx2
 sK8CbOk0+38RC9siiDQmPU/F2O9j0ecFLoic8L+FzrJRUabpSw07N9VE7yuiLzzW7h1y1qbdl
 8BDKnCLdCt5xnvC6U/4WQH3gD8OmJF1CUtq+TTldcOhSrXj2vnZzKuWHsToqAEFYdCZ+G1kJO
 eJI+QvE+W/XqfwgluGmoOkhLGUX5ldmKgX6CLe5dbZ8IawJDff5pFl8WXkpxT/eZXkoGcu7Pc
 DX0K2nek3ltsWSP9duQ3a4vbYFB6Vy/1K5FZXd9NLKDHUpyZxqAnHScrIUhhPLbR9qzqa3fP8
 S9JHwgIyqL+J55/UfSI50l6JB8pE7cNqC8+mxFk3NnopJHiGHnFN35ebeS7rKgNp85lZ5jkmG
 gtTF0wZ9Rlqj9Xn2L
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

>>> Would you like to take another look at corresponding change possibilit=
ies?
>>>
>> yes, I want to do it and thanks for your info.

How do you think about to improve the clarification around potentially
=E2=80=9Codd fixes=E2=80=9D (because of collateral evolution)?


I noticed your update suggestion =E2=80=9Ci2c: busses: convert to devm_pla=
tform_ioremap_resource=E2=80=9D.
https://lore.kernel.org/linux-i2c/20200409135224.7426-1-zhengdejin5@gmail.=
com/
https://lore.kernel.org/patchwork/patch/1222122/
https://lkml.org/lkml/2020/4/9/431

It seems that you got encouraged to contribute changes according to anothe=
r
transformation approach by a single patch for a directory hierarchy.
How likely is it that such adjustments touch source code places
where related error messages would be found for further software
development considerations?
Would you like to wait until the integration of this update succeeded?

Will it be interesting in the meantime to become more familiar with
applications around scripts for the semantic patch language?
Can the Coccinelle software make the discussed transformations more conven=
ient
also for your needs?

Regards,
Markus
