Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABF01E73D7
	for <lists+kernel-janitors@lfdr.de>; Mon, 28 Oct 2019 15:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390238AbfJ1Okx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 28 Oct 2019 10:40:53 -0400
Received: from mout.web.de ([212.227.17.12]:54539 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390235AbfJ1Okw (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Oct 2019 10:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1572273619;
        bh=QHqqOg7p5UzgEReo+nUABxaEFdkS1OmskZNlAFvY00g=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=hbfgBkj14ES3bTP4wJgu2/+HxltU6x7ci+1j5OAlPFd7OpPYKNTFXk8h9zSYiugV5
         MhyCXrgbR/2UXPJo57MyrafJzMqjj28niZDeYUEgkCYkaGAR1EgMWRk6gDNEuuN3f/
         r/nGZklY8zLya19tQlzbet77epN5rFuYsGOEMWwI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.155.234]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MXHXF-1iSY1W2J0v-00WDbn; Mon, 28
 Oct 2019 15:40:19 +0100
Subject: Re: [alsa-devel] ALSA: korg1212: Checking exception handling in
 snd_korg1212_create()
To:     Takashi Iwai <tiwai@suse.de>, Navid Emamdoost <emamd001@umn.edu>,
        alsa-devel@alsa-project.org, linux-doc@vger.kernel.org
Cc:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <s5hmudlmldk.wl-tiwai@suse.de>
 <ec3647df-0e54-4aaa-7ec7-b3dec0fa1965@web.de> <s5ho8y1au4h.wl-tiwai@suse.de>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <0daa3e27-3d1f-3040-f8e7-92ce91a97687@web.de>
Date:   Mon, 28 Oct 2019 15:40:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <s5ho8y1au4h.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TL43P9tqVb4G71gLlqBig/UUEguOCr8CxXDNfqZ0eDcapP/uWaJ
 XWlt1pfEYl91vE6AggTfHjM0jed8NPO2IOFqtalGtbxOIUarKrHM7ENV8+sUxRFcnCaRzKg
 IQ04ZEVMV+favQFma0gcWdk7+mTc6H6Ta23MsDS1ATMkyvpp56VtsphOJGQF0LHC8k8srv1
 LVs55KIUbMZvJt25uKghw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:H9T3rOFvefQ=:tvluSqaundhOP/M560f1uw
 3vLwoVdlDDZpU+EBHKPwJqRrYldzTVhfwvwonxt4tLb5U1YDbpnLoWzxwX/u0M5UGoKlJIW7+
 Lcg1jsGUFwSSJPryre8rdm+HBk4Fm2rk2nf69ApyuzyGp5PokydCs4eaYuNgnDyN+EPmac8Hk
 OeKQYRKrun0riUWmKuRQcjdRPBlGmF99wWKxUMBLFOZBtxxchmuWOe4k4IkOlDcB4xfwDuImJ
 ao4z9wcxIwowDDAEmT7gD1heVEsYwk+3YJYtsUXnMOaPHr3zxkoEKRIv3bDlSnj9zFn5b59PG
 bDoMVlsp5i6RbPg0UtfeCznDjpnv5BqlDngG5J3p+KyM/L5MVtKLOmdeobg/8/UJx9NtyTTr1
 DFfiypeJM6Ip1ZbQJl7T9fHTteCXfG2iVDA+b4sWg/btl1ErSzqsZHAyx0lQYDmZMQrXo05Zl
 prjwwT9YWG9mSb8aAxy0Fhmux+9ctqigU/XR6NIQoCojNiJIwjeLJy+tuPfaIHJHp/GEvG3+J
 TAD6Ei2ZjIFqQGKF87BqFUGMqmc9JeuEPk/D0PS9Jx1ENCTdnFq1WGFjVli9sJYo+z8ENdRmb
 20Bp87JYY3w/lupL6ZlPE2xs1GAtGJku9m/3qE+QfaXkLV4brQq8NraSB5Ghkl0uuNcXJUoYs
 1G9CA4Ri0XUx1354OG1VXeIORuBaCqW4BrszLzF1ignZ19etS4h+VC+V6HIXvYB0XamTBrBDv
 YcMECII+oVkslu9TOMG+DXZ3paHBBatd5xIKKKHzrwAY3iBeiGYK2HGkfvIiodvkQJvJg7M4D
 PZYvBlxqme5YO+GiZRJcSxAeBwrjVIPg5sg42J2zuRzj3Q2tJDB45RXjlZLXb7h5H7hKPk6qV
 vs3BuBoPRMEoB+hJMBwgFdGdmU6Ayo7SNa7zsvRZD/OpRRQ3ZO7g4iUG66QSNf7nP2dPTU80l
 gKqX8bq5JCA+Snz7bNdqY9Xawk/mw8e4XbXrAsjNZnMhHZF9+kG61j0qhQrLqhoFYj90Zt64d
 iIPuTzuT+5GGq0DQnlwkXJ9w8HgulVjvyGHapXXUFJ7Qkio1+JI00Xuo+P7m1yPxVM6uVuOTL
 m58KzynHXv0h/b+A7x4KD8sgre1xyfHY+KHJQEEXzrcNbmRPWoHh7rI4PwxndY795/iDeNy0P
 ERb8bObjo0y1Gw2mnAMlu4mnsCvkJ909zZea4PUO7dNoioqUHRTsA5lec7WjdserHt41w42jB
 HfcfLegpbvhRIZcH6p177NC0P6EgRwilq26E4oM35TMvi4slz3qxhIz76Xww=
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

>> Can the properties of this programming interface be documented also tog=
ether
>> with the function declaration for the safer handling of ALSA components=
?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/sound/kernel-api/writing-an-alsa-driver.rst?id=3Dd6d5df1db6=
e9d7f8f76d2911707f7d5877251b02#n567
>
> I can think of only adding some comment at each point mentioning that
> the resource will be managed by the device destructor.

* Which places will be corresponding update candidates?

* Would you like to choose the wording?


>> Can any more API information help to improve automatic source code anal=
ysis
>> around similar functions?
>
> If anything we can add, let me know.

Will any tags become more helpful also for the software documentation?

Regards,
Markus
