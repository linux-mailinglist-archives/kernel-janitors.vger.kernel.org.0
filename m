Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0E4159B99D
	for <lists+kernel-janitors@lfdr.de>; Mon, 22 Aug 2022 08:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233195AbiHVGci (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 22 Aug 2022 02:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233232AbiHVGc3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 Aug 2022 02:32:29 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026D1286FF
        for <kernel-janitors@vger.kernel.org>; Sun, 21 Aug 2022 23:32:18 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id l33-20020a05600c1d2100b003a645240a95so3064294wms.1
        for <kernel-janitors@vger.kernel.org>; Sun, 21 Aug 2022 23:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=o31t8HDG7QptfeLJ+04Jkz8j9NFHlDWTE2XxPfy4mY4=;
        b=irZObN1eltJOx3RhmXoVx+SqMw2ylRDjCL9UpnvBqOYkXsfa0zfc8gQMX++2ozeENA
         oUPBy1vKzLfnGYlo0m8FmoFZIftspFaobH80NatCz3HKITTnyeb/5+IussCPaM3ix+7C
         +drIiDFCd2uY35Q28zXDEE078jqZbb+d7onnkjnDcB3tIUcNAFotECVcVTV1Adn39/3U
         bUoWwrqoPFwFyoM8XHC4KX/I6DyvjmeDSNDar1AuAvv0HUORMLH7PxexW81lOj64C2/2
         ax/Ka+CI5+hlQdOq8/JhiLSd3WiKiZNhZdP+VPLuCEaaVasEQwZTviwCeL1qHeT2te/n
         KYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=o31t8HDG7QptfeLJ+04Jkz8j9NFHlDWTE2XxPfy4mY4=;
        b=7vYdSzxaUVrM53oVmF9fPaEtxj/7NJ8R8S+53DvHSpHmnYKl2W8CgBjRJufeX601pY
         sIZTm3QGA7m17mPBFKEhMpgc1grvgCA6HfuM18Mw03gyFKofhh0afc8hWKKhEQ6rsLOm
         JiE4lsFZbgjvyu3czgrdioKG4CKZaOARemdN1qV9F/RvrRbmxkM+3y0QQoNOBtSv/erY
         sdCCPCNQAWTvlJkABQjsJsjfdzJ5Kdx7iiptn0fFYWrM83A7IsfVCGamJflf+yQS/CtN
         ycRdTGXXeXs8sII4m5scNgjDiicMAUzHCBPBSYGePcUL4f1sQ1nHWhECkODC2s2fPkWA
         /xng==
X-Gm-Message-State: ACgBeo2lt8puYBpTnmBTQvLgaJp2NX4OCK8tw3sgZiavPH3+ZcsgT61a
        Fz4fI1hOleFSQuKjVUnK3k51YQDKUHAeTOqNmzU=
X-Google-Smtp-Source: AA6agR5256tAvfVJJO0CQj9RF4tqybY0R03VAdi4u2vcjxkoZrb/NBSUotfOfLcq9p1Xs6FjvMmoSzFmOU8vM+F0gg8=
X-Received: by 2002:a05:600c:35cc:b0:3a6:f08:9b1 with SMTP id
 r12-20020a05600c35cc00b003a60f0809b1mr10838510wmq.22.1661149936586; Sun, 21
 Aug 2022 23:32:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:5444:0:0:0:0:0 with HTTP; Sun, 21 Aug 2022 23:32:15
 -0700 (PDT)
Reply-To: maddahabdwabbo@gmail.com
From:   Abd-jaafari Maddah <sheishenalyeshmanbetovichu@gmail.com>
Date:   Sun, 21 Aug 2022 23:32:15 -0700
Message-ID: <CALX-7+1qNb9UdqGCv4rX3wWOU+RrnU8o4moJ8+T0+0Vqx2_04w@mail.gmail.com>
Subject: Why No Response Yet?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

-- 
Dear,
I had sent you a mail but i don't think you received it that's why am writing
you again,it's important we discuss.
Am waiting,
Abd-Jafaari Maddah
