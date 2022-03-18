Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFF404DD337
	for <lists+kernel-janitors@lfdr.de>; Fri, 18 Mar 2022 03:45:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiCRCqu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 17 Mar 2022 22:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbiCRCqt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Mar 2022 22:46:49 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E7C19B09A
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Mar 2022 19:45:30 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id j18so325931wrd.6
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Mar 2022 19:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=/c0Iug26q6VjeWZuRvSdzvpLlZxwZvT/Nmzo+p+K+ao=;
        b=cMr6xra8Ou8Sv9Pn1dh1tcTNu15GiGkxpSh4F4kusSheB6xzPaIIGYhtNWu5xpJuOO
         g7TIggkF71KvzKTgfoCDLRooEqjrSn7m/IpdjbHtNYwJUP6Z6H9yIjF6nnHeuVqzS6Xh
         WK3I+5nSp1ghR69JCpUY0SMtLtAXxniIJN5qFD4Brc9K/7NWhR5oORze9X7zgeGKdMqc
         ULJlWG3m8B/RZO6BXB7tvxDVdWvquc9N+oCXpO/pOi37FnRn1IjFGVPK/uI5lOXqzCr/
         ibKxsszgJKSzPAkXcblA6egR/bKaDteDQZH4B57o+7WBkhCa9foyDIBrv6SM16Lhy/jO
         Wysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=/c0Iug26q6VjeWZuRvSdzvpLlZxwZvT/Nmzo+p+K+ao=;
        b=V6HXlUSW2TxOQRNqsuNjz5Cf8Ew0CvjDOuf090J1Fql62dTZe8Q/mpP0F6QqtrswRY
         iRoocmQ6849qKXD6D47oYW8iUG15WrsbQWNU0PP/EVKLcxYpGxNAYnMWwTQjm8XRyIu8
         jBwl0VJBBCvJk82KEd9YgTQCF3bO7R1LmO0O35So3bcoUVJwuEyVtZ2JI+aD3eq+FnKn
         MjsaDq6sU4XpWO/KkQaCaQHzwCJZfcBcJpEDk6zkfSaINeehq40I/ZsLeJoPXYp5WESC
         RaRvlK4GTcXBqE535wrWacaW3uVHd10QUiPOy7vB13e+S8sat7UNZoAPpzgFCbFz+6cm
         slDA==
X-Gm-Message-State: AOAM533II5SW0iUFbeAcKvTXZGfXGFcIhLR5MI5EOOZn/NFbeNNpLIzP
        dGeswfCMg5S8LN6ZzSn6aAI=
X-Google-Smtp-Source: ABdhPJxhJ/KTRziDzcSLtfhDy3jHlWqvWY9IeBt0ruzajB4VxsUYbBbPYnegYOsacioLS8aBRttOEQ==
X-Received: by 2002:a05:6000:18ae:b0:1f1:f7f8:5a4d with SMTP id b14-20020a05600018ae00b001f1f7f85a4dmr6079857wri.43.1647571529408;
        Thu, 17 Mar 2022 19:45:29 -0700 (PDT)
Received: from DESKTOP-26CLNVD.localdomain ([105.112.33.76])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c358400b00389f61bce7csm7921687wmq.32.2022.03.17.19.45.21
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2022 19:45:29 -0700 (PDT)
Message-ID: <6233f249.1c69fb81.feec5.f474@mx.google.com>
From:   Barbara Finance Company <paulyoropuu@gmail.com>
X-Google-Original-From: Barbara Finance Company <info@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Schnelles Kreditangebot
To:     Recipients <info@gmail.com>
Date:   Thu, 17 Mar 2022 19:45:13 -0700
Reply-To: barbarafinancecompany@gmail.com
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hallo

Ben=F6tigen Sie dringend einen Kredit?? Wir sind ein zuverl=E4ssiger, vertr=
auensw=FCrdiger Kreditgeber. Wir verleihen Unternehmen und Privatpersonen K=
redite zu einem niedrigen und erschwinglichen Zinssatz von 3 %. Antworten S=
ie uns unten mit Details, wenn Sie interessiert sind. Vollst=E4ndiger Name,=
 ben=F6tigter Kreditbetrag, Kreditdauer, Land, Telefonnummer, kontaktieren =
Sie uns jetzt unter: barbarafinancecompany@gmail.com
