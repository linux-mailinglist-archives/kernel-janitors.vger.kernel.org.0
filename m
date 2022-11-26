Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 461B36392C5
	for <lists+kernel-janitors@lfdr.de>; Sat, 26 Nov 2022 01:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbiKZAe6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 25 Nov 2022 19:34:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbiKZAe4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 25 Nov 2022 19:34:56 -0500
X-Greylist: delayed 474 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 25 Nov 2022 16:34:55 PST
Received: from mail.psssf.go.tz (mail.psssf.go.tz [196.11.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 610BB5A6CB
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Nov 2022 16:34:55 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by mail.psssf.go.tz (Postfix) with ESMTP id A9FDC1003F94;
        Sat, 26 Nov 2022 03:25:17 +0300 (EAT)
Received: from mail.psssf.go.tz ([127.0.0.1])
        by localhost (mail.psssf.go.tz [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id R1Jlm0A1C6nD; Sat, 26 Nov 2022 03:25:17 +0300 (EAT)
Received: from localhost (localhost [127.0.0.1])
        by mail.psssf.go.tz (Postfix) with ESMTP id 6A3FC1003F63;
        Sat, 26 Nov 2022 03:25:17 +0300 (EAT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.psssf.go.tz 6A3FC1003F63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=psssf.go.tz;
        s=psssfdkim; t=1669422317;
        bh=GgFYceHPfP/4Ju84fndFJB/TSJ1oqCCcVK78ii2DXwQ=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=Rvx9Fy8aZ0BQOBB+dlnmWQ6tU9SrIjDIoCCeBCYS0CCfLLhg77o2M62SWM6VRzaft
         AjhSRvfyB6nn+92ovWkjnt+HKvSLC3Vdr8+n+Ry1qLnMvigEuwXnlM9U/52kxRmddl
         b70oXuc76wXCgzy2+6/A4UsrT6/jZJy54GR2CecgKLKBIJTlbWCRmyv1ocbglKABQ+
         K883qBuIKLbzCWy3f4pvW3ssFdKZa5KkvLzjaIFiPQItrOaQgVgMz7jhcgmsOTPwaG
         0vACsUNYg73nNpqaZ1eG6A8yoiunBsuFJ9JK+31qbkfAg24NJE2704LJXY2QkLmnC0
         t+vr6hl3RfEFA==
X-Virus-Scanned: amavisd-new at mail.psssf.go.tz
Received: from mail.psssf.go.tz ([127.0.0.1])
        by localhost (mail.psssf.go.tz [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id nNviRPUsHVdu; Sat, 26 Nov 2022 03:25:17 +0300 (EAT)
Received: from EC2AMAZ-O7KPIJ2.ec2.internal (ec2-3-238-242-41.compute-1.amazonaws.com [3.238.242.41])
        by mail.psssf.go.tz (Postfix) with ESMTPSA id 3F3141003F94;
        Sat, 26 Nov 2022 03:25:12 +0300 (EAT)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: 
To:     Recipients <lusajo.anderson@psssf.go.tz>
From:   "Rowell" <lusajo.anderson@psssf.go.tz>
Date:   Fri, 25 Nov 2022 19:26:47 -0500
Reply-To: rowellhm0192@gmail.com
Message-Id: <20221126002512.3F3141003F94@mail.psssf.go.tz>
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_95,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  3.0 BAYES_95 BODY: Bayes spam probability is 95 to 99%
        *      [score: 0.9622]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [rowellhm0192[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 RCVD_IN_MSPIKE_H2 RBL: Average reputation (+2)
        *      [196.11.255.52 listed in wl.mailspike.net]
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hope you get my mail
