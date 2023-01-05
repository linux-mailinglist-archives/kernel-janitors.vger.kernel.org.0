Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1D865F53B
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Jan 2023 21:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234755AbjAEUbe (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 5 Jan 2023 15:31:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234237AbjAEUbE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Jan 2023 15:31:04 -0500
Received: from email.pdamkotamalang.com (unknown [114.4.39.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162916338A;
        Thu,  5 Jan 2023 12:31:04 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by email.pdamkotamalang.com (Postfix) with ESMTP id C6D48139D53;
        Fri,  6 Jan 2023 03:24:28 +0700 (WIB)
Received: from email.pdamkotamalang.com ([127.0.0.1])
        by localhost (email.pdamkotamalang.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id a-LvmMomYNEt; Fri,  6 Jan 2023 03:24:28 +0700 (WIB)
Received: from localhost (localhost [127.0.0.1])
        by email.pdamkotamalang.com (Postfix) with ESMTP id 8B9B3139D6E;
        Fri,  6 Jan 2023 03:24:28 +0700 (WIB)
DKIM-Filter: OpenDKIM Filter v2.9.2 email.pdamkotamalang.com 8B9B3139D6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pdamkotamalang.com;
        s=62829964-9E69-11EB-BD22-25F53CE53079; t=1672950268;
        bh=esox1GoxVQJW59HRUBvaPTukA/9qNhV3fwI/h3ErfWE=;
        h=Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:
         From:Date:Reply-To:Message-Id;
        b=lAGGclCLubqDylawqEF7GRO7ky/gdR7Y46C/eZuAo3YUIczcOSCr0k0qJnG0qgwct
         cnQ//YtX/QmIS549qofv2C/eFmGNUFJZsfMQ+oeObiE1smb44HeAQhH1NnNtQKguiZ
         vH/VekC+zLXZpv3CXStxK/Y5LRpf2HFbSS5MWPVo=
X-Virus-Scanned: amavisd-new at email.pdamkotamalang.com
Received: from email.pdamkotamalang.com ([127.0.0.1])
        by localhost (email.pdamkotamalang.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id tebdln23W84g; Fri,  6 Jan 2023 03:24:28 +0700 (WIB)
Received: from [192.168.100.49] (unknown [138.199.59.202])
        by email.pdamkotamalang.com (Postfix) with ESMTPSA id 2A821139D53;
        Fri,  6 Jan 2023 03:24:09 +0700 (WIB)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE:
To:     Recipients <lpse@pdamkotamalang.com>
From:   Susanne Klatten <lpse@pdamkotamalang.com>
Date:   Thu, 05 Jan 2023 23:23:50 +0300
Reply-To: belillrobertlee608@gmail.com
Message-Id: <20230105202415.2A821139D53@email.pdamkotamalang.com>
X-Spam-Status: Yes, score=7.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,PDS_RDNS_DYNAMIC_FP,RCVD_IN_SBL_CSS,
        RCVD_IN_XBL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [114.4.39.122 listed in zen.spamhaus.org]
        *  0.4 RCVD_IN_XBL RBL: Received via a relay in Spamhaus XBL
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [belillrobertlee608[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  1.0 RDNS_DYNAMIC Delivered to internal network by host with
        *      dynamic-looking rDNS
        *  0.0 PDS_RDNS_DYNAMIC_FP RDNS_DYNAMIC with FP steps
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Nazywam sie Jeff Bezos, dyrektor generalny Amazon, w tej notatce informuje =
swiat o moim zamiarze rozdania mojej fortuny w wysokosci 124 miliard=F3w do=
lar=F3w mojego majatku szczesliwcom w calym kraju i na calym swiecie.

Tw=F3j e-mail zostal losowo wybrany, aby dolaczyc do os=F3b, kt=F3re beda b=
eneficjentami tego projektu charytatywnego. kazda osoba otrzyma 1 200 000 0=
0 $.

https://www.cnbc.com/amp/2022/11/14/jeff-bezos-says-he-plans-to-give-away-m=
ost-of-his-124-billion-fortune.html

Skontaktuj sie z Agentem Panem Robertem, aby dowiedziec sie, jak postepowac.
E-mail: belillrobertlee608@gmail.com

Z wyrazami szacunku.
