Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 025CE77278A
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Aug 2023 16:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbjHGOWB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Aug 2023 10:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbjHGOWA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Aug 2023 10:22:00 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3A4A4
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Aug 2023 07:21:59 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-68783b2e40bso3073997b3a.3
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Aug 2023 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691418118; x=1692022918;
        h=reply-to:date:to:subject:content-description
         :content-transfer-encoding:mime-version:from:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qeJMC8uQd6uF4qr+WdPwE3eIC4QtXm265LEcDc12V2I=;
        b=oUNTD00HKnXJJEo7f6C1EWlaHXhcFfM5HgyzAMd3cK23Y3tALKwUUGqH6bS7FQMwVM
         ONc3t39c+xF6mHTahHhFsr0ZWYm8qwR1YdOW7FYyyXGvcYktxZN23z0Lx6HyoAk6KrRy
         hxbXSToN7CZCHyuKymOLoiaGBGCOc3y5JF3WmTdxuFVWILEpXUpsRKiZzaKo0EIV0Lf2
         aPIz36LA+j/9ACeFRVEGgUHqK+8A4mtk2IXjnsgv4KhV4+mbeoBpL+0Y4cosNbztGNyS
         LRRUzl+Ny4Bp4o4hDIotc9gU1u+0TsrPbAX/N96GtXe8Ra2+n4QYAWUmfFbtAHc4j9lT
         bwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691418118; x=1692022918;
        h=reply-to:date:to:subject:content-description
         :content-transfer-encoding:mime-version:from:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qeJMC8uQd6uF4qr+WdPwE3eIC4QtXm265LEcDc12V2I=;
        b=BTNWfYqG3Nif/x+4fzPGo4yXG2VHAXaGTSX26Hnx/1O40jy3lh7sY7e60wwXQR0+TP
         KJayThWI0pHuL+T2rOIU3Vwd3DInAJy8Mqf+TyroxIpETnMz2AsmbcPJKomaqm5iRlmD
         Gbff/W+bjaoqRMiVIwuHjKdJmloGu8DtfMjVgsLN7agJkgbPXRbP6CTVskRRcTmmdPSi
         EtGgX5Jqh8lp0NcYxrsJuuv9lym2qhepyvhd7vmalcJ5XxtD/OWF4zYBVWAQrH1ELWC1
         3+zPmqnvVXC44wmMR2uZ3s3d4RG1RFSC5xSxSZ/KQrvNWHIcre9hteW7QBtgKs0m/s+x
         sL+w==
X-Gm-Message-State: AOJu0YwCVEcGyigVzClvsFX81kRyQssZWtxed6MzLBlTc7xkMzYiq6rz
        e5yekzkew5gmN1V44H3XCBPKzMbX9BZqzH3b
X-Google-Smtp-Source: AGHT+IHZ9mcRATu+E5k0ASUrCMucuoEgxt/dm8TiBwG6bB/9FkODLmAw9KktfM0H6890Z5F9hi/h5A==
X-Received: by 2002:a05:6a00:a1b:b0:686:2ad5:d11c with SMTP id p27-20020a056a000a1b00b006862ad5d11cmr9443190pfh.33.1691418118473;
        Mon, 07 Aug 2023 07:21:58 -0700 (PDT)
Received: from [192.168.1.102] ([192.166.244.71])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b006873aa079aasm6458661pfe.171.2023.08.07.07.21.56
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Aug 2023 07:21:57 -0700 (PDT)
Message-ID: <64d0fe05.a70a0220.92385.b702@mx.google.com>
From:   World Health Organization Empowerment Group 
        <samanthamadison465@gmail.com>
X-Google-Original-From: World Health Organization Empowerment Group
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: We have a Job opportunity for you in your country;
To:     Recipients <World@vger.kernel.org>
Date:   Mon, 07 Aug 2023 21:21:39 +0700
Reply-To: drjeromewalcott@gmail.com
X-Spam-Status: No, score=2.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,TO_MALFORMED,T_FILL_THIS_FORM_SHORT autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Greetings! Sir /Madam.
                   =

We are writing this email to you from (World Health Organization Empowermen=
t Group) to inform you that we have a Job opportunity for you in your count=
ry, if you receive this message, send your CV or your information, Your Ful=
l Name, Your Address, Your Occupation, to (Dr.Jerome) via this email addres=
s: drjeromewalcott@gmail.com  For more information about the Job. The Job c=
annot stop your business or the work you are doing already. =


We know that this Message may come as a surprise to you.

Best Regards
Dr.Jerome Walcott
Office Email:drjeromewalcott@gmail.com
Office  WhatsApp Number: +447405575102. =

Office Contact Number: +1-7712204594
