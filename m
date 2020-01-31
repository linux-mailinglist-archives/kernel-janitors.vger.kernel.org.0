Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8120E14ED1A
	for <lists+kernel-janitors@lfdr.de>; Fri, 31 Jan 2020 14:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgAaNRw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 31 Jan 2020 08:17:52 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:51999 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728579AbgAaNRw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 31 Jan 2020 08:17:52 -0500
Received: by mail-pj1-f65.google.com with SMTP id fa20so2820489pjb.1
        for <kernel-janitors@vger.kernel.org>; Fri, 31 Jan 2020 05:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=4RbjksI4ZVf8jlMAui9QSDoZFwWF9mQNUo5m2497TSc=;
        b=sw0BNkY2xodLl19tF1NzSAwlrgB/f0xz/drT1C8nMWvnI44LGv/UHTZDSZv93CiLPc
         GnNuM9xVL6klOq9cj1I9TMAI68M111pw3maiRrp2U/0drrI/GGnFN7KpfTXErG9vxvma
         TYO8AqqrzJY9afrm07s2Go9klVwC7dkCNlolrb67wEXGquYz/RzIJ6vHYQwNcIhz2pzZ
         FJK5Nu0T3J4yVl+laCkNHcpEtKMJBlyx+wNqn7tg/lkcbqrbY+QSIrJPUn+X8l2UhJe0
         HPiIU/onHOS68R80wRZh4Tr2LxSKJ6ClI8HYJrUIalHaTw8ZGCEcITHGU4EyK+sdo4Pc
         aWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=4RbjksI4ZVf8jlMAui9QSDoZFwWF9mQNUo5m2497TSc=;
        b=Sw5aM/DKGUZgoZyEtLz1v9ANnzv0hXtEk+TuK/bWkE0/foOm434OHZGSGLtiCb63KK
         Cp/yX5Zhbfrogt5zksURm1mkiVZmR0UPhW0SN0T1iNKYc10YLtgETDyDzGtHdXSzssYC
         kuHTnr6734zMOpFtEgg/gbt9/9gCiUQbItX2/blUaYxmAdXdH3HIKouPJbiPmuZ4Aovv
         VJCwkxxFSy90nHUqZp3pQ0KEvtPxgLMXBi1n+NWzepFc0jkOq98JM6JyzOFajTsK3hmI
         t21SlQSza15epidrVvl/piU3ZZtDNh4uyxeu1f7xOfh3Hc99/mwqcplk8n10XQDACBNU
         uN4A==
X-Gm-Message-State: APjAAAU8hq2H2ZKrVQVJ4hjNsH58X5MnAinI7FOF+7DIzJ4xuZs7bWM2
        61oZJ4sR78BE7O4JIA5up3HV9xvt8878v2rVJt4=
X-Google-Smtp-Source: APXvYqwE7DlH1YiQJsaWn8qGn6NiK6RbKG8AfadkZhmxhL2Mo9Tt20NUDrRGnKXy1I6/GdXv06q/saQe3WAUsnWZZIs=
X-Received: by 2002:a17:902:8549:: with SMTP id d9mr9925631plo.153.1580476671348;
 Fri, 31 Jan 2020 05:17:51 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:90a:480d:0:0:0:0 with HTTP; Fri, 31 Jan 2020 05:17:50
 -0800 (PST)
Reply-To: aakkaavvii@gmail.com
From:   Abraham Morrison <drjameswilliams1924@gmail.com>
Date:   Fri, 31 Jan 2020 05:17:50 -0800
Message-ID: <CAPBADDFtdL8K1HRjpLn8+ah0=O=MzQOy-WqoP10nXsT0SVimMA@mail.gmail.com>
Subject: Good day!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

RGVhciBGcmllbmQsDQpJIGFtIEJhcnJpc3RlciBBYnJhaGFtIE1vcnJpc29uLCBEaWQgeW91IHJl
Y2VpdmUgbXkgcHJldmlvdXMgbWVzc2FnZQ0KdG8geW91PyBJIGhhdmUgYW4gaW1wb3J0YW50IGlu
Zm9ybWF0aW9uIGZvciB5b3UgYWJvdXQgeW91ciBpbmhlcml0YW5jZQ0KZnVuZCB3b3J0aCBvZiAo
JDIwLDUwMCwwMDAuMDApIE1pbGxpb24gd2hpY2ggd2FzIGxlZnQgZm9yIHlvdSBieSB5b3VyDQps
YXRlIHJlbGF0aXZlLCBNci4gQWxleGFuZGVyLiBTbyBpZiB5b3UgYXJlIGludGVyZXN0ZWQgZ2V0
IGJhY2sgdG8gbWUNCmZvciBtb3JlIGRldGFpbHMuDQpUaGFuayB5b3UuDQpCYXJyaXN0ZXIgQWJy
YWhhbSBNb3JyaXNvbi4NCi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uDQrQlNC+0YDQvtCz0L7QuSDQtNGA0YPQsywNCtCvINCR0LDRgNGA
0LjRgdGC0LXRgCDQkNCy0YDQsNCw0Lwg0JzQvtGA0YDQuNGB0L7QvSwg0JLRiyDQv9C+0LvRg9GH
0LjQu9C4INC80L7QtSDQv9GA0LXQtNGL0LTRg9GJ0LXQtSDRgdC+0L7QsdGJ0LXQvdC40LUg0LTQ
u9GPDQrQstCw0YE/INCjINC80LXQvdGPINC10YHRgtGMINC00LvRjyDQstCw0YEg0LLQsNC20L3Q
sNGPINC40L3RhNC+0YDQvNCw0YbQuNGPINC+INCy0LDRiNC10Lwg0L3QsNGB0LvQtdC00YHRgtCy
0LXQvdC90L7QvA0K0YTQvtC90LTQtSDQsiDRgNCw0LfQvNC10YDQtSAoMjAgNTAwIDAwMCwwMCkg
0LzQuNC70LvQuNC+0L3QvtCyINC00L7Qu9C70LDRgNC+0LIsINC+0YHRgtCw0LLQu9C10L3QvdC+
0Lwg0LLQsNC8DQrQv9C+0LrQvtC50L3Ri9C8INGA0L7QtNGB0YLQstC10L3QvdC40LrQvtC8LCDQ
vNC40YHRgtC10YAg0JDQu9C10LrRgdCw0L3QtNGALiDQotCw0Log0YfRgtC+LCDQtdGB0LvQuCDQ
stGLDQrQt9Cw0LjQvdGC0LXRgNC10YHQvtCy0LDQvdGLLCDRgdCy0Y/QttC40YLQtdGB0Ywg0YHQ
viDQvNC90L7QuSDQtNC70Y8g0LHQvtC70LXQtSDQv9C+0LTRgNC+0LHQvdC+0Lkg0LjQvdGE0L7R
gNC80LDRhtC40LguDQrQodC/0LDRgdC40LHQvi4NCtCR0LDRgNGA0LjRgdGC0LXRgCDQkNCy0YDQ
sNCw0Lwg0JzQvtGA0YDQuNGB0L7QvS4NCg==
