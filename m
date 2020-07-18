Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93F7224924
	for <lists+kernel-janitors@lfdr.de>; Sat, 18 Jul 2020 07:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgGRF4c (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 18 Jul 2020 01:56:32 -0400
Received: from mout.web.de ([212.227.15.3]:42195 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbgGRF4b (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 18 Jul 2020 01:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1595051781;
        bh=e8QEKjxgVOB4Tc+3b/KVzzEg9Z9l1jW6d/zTFip2qtk=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=i02VSGc9ba5W7cCQmSc+1h3gU/wLvs58xkVksQMYtF34BzHOAmHngzuzKE7O5+qNf
         Ct2Y+a74xHxuP6YSOIE53bou5nElcx+vrj153V6K7WA/n93Rg+XN76AiorNim4f8S3
         SpEVJyEHzqrEemYYdrYCHT9mCWhImE9+aLwSbjxc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.120.168]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mvbms-1knwhv2qOs-00sbjI; Sat, 18
 Jul 2020 07:56:21 +0200
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [v2 1/4] coccinelle: api: extend memdup_user transformation with
 GFP_USER
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To:     Julia Lawall <julia.lawall@inria.fr>,
        Denis Efremov <efremov@linux.com>,
        Coccinelle <cocci@systeme.lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>
Message-ID: <0b9f2c58-e124-22d2-d91d-62a6e831c880@web.de>
Date:   Sat, 18 Jul 2020 07:56:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
X-Provags-ID: V03:K1:lBF9CHro4HH8Xgnfi7mVEyT4v+iT2+U83uVQ2rSQJAeVhX3dGdX
 y4KWJ8M+Hv79xU7Woez+mddOryXD9dmFhFbxjh97YfWV8wIc1/ni4XmArkWk5cM/WEcqhxu
 6NkPSGZmU20+4uXGp4xipAxwqZv1gJmuH1+RPbIVT1QSdjjl1qxl6L9k26gvdTXcqnS67wD
 B1zPSdzCNdo5z4Ltx43uA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kWAZzIxeGLA=:DOdUhXKTf/5Xiz5JER0x4R
 VlAcpfzAIJ2Pm1R2qez/ZByOFgdaM6LHG7TVmTUddS8hMrCg7wcEF7oBUN8Wej4Rw7Jj98+Q0
 DLtmUtEpZwOWsnPq1JN94WMN2JlEN7fvxH6Sxmd7ZuoH+oTZG3ya94k0/gUQEqmUzDLcBxTlU
 nuWvgdRMW+XvSVWjopTvL2b/002r5k0DXZMHERqkUBBrX/kmHfTX/24pqo9IVyF3RkpVs1rf1
 9grN7J2rZiyNrGMNf+NzPG+5DKzG6IBPIDpzmUJosPAmvgkuUZRxEgAlp3VKiMvHDYfmkzwu8
 tLKW6MICZzLFC1nrZfSsD/Md2LS0IJ8OFks1+JBWtU0E9Z/d84xcKs6uhdj84BBVGPyoXnwi3
 iDceslnTsHpJ5KAI4Fm5oNwPzz3cSPV3aq21UHCigY1Q1FELzjmgQHcGYpJw3FmCIC+ibOp36
 ONeKbqPdXMu2ed68O107IBnONc37f0d9lahcHL4nJuVif3ale/DPnqMCl8EmDGiQrkzgQnh4w
 zmsQrPcVqjFrg1+WIsurN4Uk6X3kITcnrMMBplXmewkm28EA3iiwrQPjJr+2KtMy69Krb0hhQ
 1S+PpKHBTX1kNidYAw8+pGlivhMFCEUTnacYFxiWvlCJm+uFMDlAWlLotzbuWvm1NIegSlggb
 cQPeDmY8opdgCXdKbbNfjHFp1qNbwANTk39iHaptICbW/+1As9xAnmaOEZQ7mgsz41nQ4kqmk
 TZhjBW9svo9DJrWUowQcMsB1K1Gz9eEW/rNB/XkzyLwdz9n+OCjABm9Nb/H3nrG5UtDSQ7/PO
 gBivfldedtKnFYwG2k/tCrwb1XevQIBws9mgPYPViwPj4W9T6/MOGOw7/hXgFn02OO3MVUPj6
 gtp5CLnBkXRN6SnaFA5mUI+vcsDCpzTrG10uCvau0kY32Sgx+zAkzca4YmJbVrtxXjGl0JO2Q
 +dmjlV43IkpUbsY2htcFvskzTMdRd8H+rd5pEZ/3Pmn6VWPRKeR5h8rw8fk3Vo3cx2piut21m
 8L9A1HlGYJm6J1oHwhDT/W42a/AuVzQmT9IOFILhsFbnBIpK7MDa/MjYhMMw6Q5+zqPoXnD9P
 ifcNyMh7cJfYxVmWATCPfn2OkfyzysnmO95Qx8eIemKFi7Pj7Lx578ATjEaiydxFMShLUNTI+
 nUP5Y+agOZ1EL416LdU3h6V7jdKndbrNF0m/2mc1/2ZJOjmeB07zj+Ff9MYQYCSf5nV/5nvIb
 P1BRLwrPqyHjEid79uydcW3d25eRJ8pXD0oTI+g==
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> Applied.

Do you care for patch review concerns according to this SmPL script adjustment?

* https://lore.kernel.org/cocci/5c0dae88-e172-3ba6-f86c-d1a6238bb4c4@web.de/
  https://lkml.org/lkml/2020/6/9/568

* https://lore.kernel.org/cocci/c3464cad-e567-9ef5-b4e3-a01e3b11120b@web.de/
  https://lkml.org/lkml/2020/6/8/637

Regards,
Markus
