Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD68784E10
	for <lists+kernel-janitors@lfdr.de>; Wed, 23 Aug 2023 03:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbjHWBOt (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 22 Aug 2023 21:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbjHWBOs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Aug 2023 21:14:48 -0400
X-Greylist: delayed 903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 18:14:35 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A917AE4D
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Aug 2023 18:14:35 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-1a-64e5450b901d
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 7B.28.10987.B0545E46; Wed, 23 Aug 2023 04:30:19 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=S2rvOuP5m0JlAHMdb5tJOaSQOwyZasAMfO8rT7FuQ+vxEuK47LhuZ4AB2RKCro3K6
          Qyd8Jo4w4xld32N7EZm8xNGqVyC52VkTiBmgGZ2fn15QlsgUx3MkAlyUA+CsDNnu3
          T7TzjjfMIEhkmhXWSpXy5Cl1w1/gYXeWvpXs7FEis=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=d9etdZB+Wx8YZo7saODnjcJa/gr9RMKXCd1ndxJiYhy80DXQQjVZWKldXghJOzZiG
          BYPlC5QpZwnR7OqKvQlI+CjTyc/LBWJ++p9yoetZI6C6qRLSylBR3DxXnaBnScJpZ
          hajvlHlImcWH9Ap7BtB61eNvbdjWYw2bFK5TVep3U=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:01:36 +0500
Message-ID: <7B.28.10987.B0545E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     kernel-janitors@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:01:51 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsVyyUKGW5fb9WmKwZwGUYutt6QdGD0+b5IL
        YIzisklJzcksSy3St0vgyliy7gJLwW7mirb+RSwNjI+Zuhg5OSQETCR2v2hl72Lk4hAS2MMk
        se/FaWYQh0VgNbPEhP6PUM5DZoln864zQZQ1M0rcO9zFCtLPK2AtMWPbfHYQm1lAT+LG1Cls
        EHFBiZMzn7BAxLUlli18DTSJA8hWk/jaVQISFhYQk/g0bRk7SFhEQFliwgGwKWwC+hIrvjYz
        gtgsAqoS0168A5soJCAlsfHKerYJjPyzkCybhWTZLCTLZiEsW8DIsopRorgyNxEYaMkmesn5
        ucWJJcV6eaklegXZmxiBQXi6RlNuB+PSS4mHGAU4GJV4eH+ue5IixJpYBtR1iFGCg1lJhFf6
        +8MUId6UxMqq1KL8+KLSnNTiQ4zSHCxK4ry2Qs+ShQTSE0tSs1NTC1KLYLJMHJxSDYzb78ub
        LFBY+ufRw+hNq6d/mM2x73eDv/0cX53f2SeKJnw5EVdnr5C6eHGg4bKrHyPCVaOO7a4vXBl3
        wS139nMD9aRfl/Yo6/At8y6UDmHydtM89fhl1Ytz604c49l4NXpptbfCrXVGpsYrSmbff26c
        XJlRIOEs83e204HsrsnqfhNn7XX59UdCiaU4I9FQi7moOBEAumNirD4CAAA=
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

