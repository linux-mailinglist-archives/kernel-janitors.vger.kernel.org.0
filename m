Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB323551AD5
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Jun 2022 15:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243347AbiFTNeU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 Jun 2022 09:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345967AbiFTNc3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Jun 2022 09:32:29 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F2F25EBE
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Jun 2022 06:12:39 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id u12so21013263eja.8
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Jun 2022 06:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Jh3M8LDovYWs/mBJiVJoI/DS8xun0EDDqspVSX/swmY=;
        b=cdbQlhAwiwOBBeuWnVDSxlJvYm/Hv5nIKBZ7MwKdnuLCI7/FPylffLh1/Ql3OrdVyJ
         OnIKaKq9OkCPcSgj/24nhw3kqNaa9+QJzioPCKlZrSze3Yl1cgVxkxSM7l/SpKDJMhQ9
         xKnemzzh503nj2WKtOQgIkM7VzUHkxnyge1MeuNVCwl2NsLyZ+w3SKB8EnAM876vCYf1
         Q1urDdHloiXwT0crnJXl6Gb4bHRhaZapWoNVgNk/LakiTwRGJbdY/ToykAgSQltH/Eoq
         3TQ/QNs9ZGMUjvC2snvAu40ncQ3WShS02ZGErf5uRbqSKgyhnbuTAMiu6iV6tPOR0uup
         4IOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Jh3M8LDovYWs/mBJiVJoI/DS8xun0EDDqspVSX/swmY=;
        b=rJTR6qikzGYD0bZLRe50bTggu95trNSxinxeviqjpuz7/I1jGf/HlryBgwifFFdUK8
         rXElbvXApQZ7XAgLkV5oUQEBh0AAs6zR3EijigZ7WirO4C4f4b/cx7EIWXB7jluOEI8E
         jJG2bNyUhWgFVSuHL9DQpxDRL7AZk8Wjx/gkzsVQNsTrAxKHl8V0mlDrr34h+Scdk5Mt
         qyF4xjWZS/A1Q8MvKmuw7V+r7ixvJChnA0d7JRSvNnf6fKj+/EugYNgtuY7+bEyKZC1S
         fbHaNvoZAxkaeEeFOkAwe6AoDiAk6cfOVgFx/8zRwlyzO+umkiVzZZx+Recvc2yugln/
         EVPg==
X-Gm-Message-State: AJIora+4qE13dzLUFHg38+2UG0Zg52BxVWP21D8lJfawSN9b08dV4Nso
        jxKYm5cjm29B43Wyz/MM/M+GdJGYFlPV8yMSCtQ=
X-Google-Smtp-Source: AGRyM1ujiE9Ysua5A16xJw4R/0jwIulaY3x+kZdbWrrSA3QzjqoFwlbYLjmcb0lnMGb8xRirvY+SrHAaqss3b1uodWs=
X-Received: by 2002:a17:906:49:b0:6f3:bb5e:54a8 with SMTP id
 9-20020a170906004900b006f3bb5e54a8mr20925781ejg.534.1655730718316; Mon, 20
 Jun 2022 06:11:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a7c:8e4d:0:b0:175:b093:85fd with HTTP; Mon, 20 Jun 2022
 06:11:57 -0700 (PDT)
Reply-To: josephkavin71@gmail.com
From:   Joseph Kavin <joesphsmith925@gmail.com>
Date:   Mon, 20 Jun 2022 07:11:57 -0600
Message-ID: <CABChVmff1f6uUXCVct9iCxttzoUDCPO4D88CFdzev-eVBp9-0w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi   are you available to  speak now
Thanks
