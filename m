Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C06C707C29
	for <lists+kernel-janitors@lfdr.de>; Thu, 18 May 2023 10:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjERIhy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 18 May 2023 04:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjERIhx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 May 2023 04:37:53 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48CF0172A
        for <kernel-janitors@vger.kernel.org>; Thu, 18 May 2023 01:37:52 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-ba1815e12efso1452510276.3
        for <kernel-janitors@vger.kernel.org>; Thu, 18 May 2023 01:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684399071; x=1686991071;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=VbgXpjNVuoHCt8MpqwIxrQwpRpefKezlaIVlcGsHWbBbYjWCj/9auG0DsPl5eFVejK
         zNvcuTbwjxqzk0MASruQ2hWUvJYwmCAcM5qJgQQ9nLnh2drXSO2xfDJXd7KMFW06PT+s
         Pi5WpHxqgHgqhnBz6vb5RrqDgELqhVxDNB9cHE/DHxP2F3AoOvU94Wi2meKDuRBtjHJZ
         8Hpk7yjRI/BCM1k0NTGAL4hJUplSQFxkJrCtvOylLuoECsvVqjaf2zmBg1n7KM6GYOiM
         gh1TsxuiYFw60hZr/RnQ/wEtFteCtnvtXIOqhYvR2yT9oZo94UaI6qCC/nTuatBe4yuU
         YWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684399071; x=1686991071;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=c41TNxkwZU1Klduxay+7cdL1/Y2IY8mNmr/CAYcjRc+ipybDWbeJMVY6nZcVmrWDTA
         pPCjaCs+00yivMk4G19wBwKIAwq4o14l7s7dQffSD5+m4Yot3lYrLn6fzOf/CvwxC8GS
         KjT4bVVYlij8Fnu1cfzowrEQVn7OWsGMAQTKzQ5PGIOFElK3G50dxt/qiMtJGKD4nYDy
         YpDTmUeCfqqEYUN/EA31UZEOxjfddZd1Qu/Vhgb36qMAs5rn/yf6NANxTkllvP3pLt0S
         B/3uvC91+4q9DF4JOKr2n7RpCc77aw6Cs8K0ahcmixH+xSKQRzxlPoiEgr6uPDejdpvV
         aWpw==
X-Gm-Message-State: AC+VfDwDNbx6+KRZO1+uJzIktiUvz7rIaNSW0FxUT35c0zFrbd8Mpxp8
        VLpvSmK49w0b5aOV17jukHpmC86KzPgfh6uGt98=
X-Google-Smtp-Source: ACHHUZ6u9nDw38a0Nbc+/LgQbJmRagDQwJeZBaE28n3YHjSo6TApu/gx63sEWYWN2wfkm9LC+4nG7ek4a0E+Gbe6XD0=
X-Received: by 2002:a25:c08e:0:b0:ba6:9f1c:1292 with SMTP id
 c136-20020a25c08e000000b00ba69f1c1292mr788885ybf.32.1684399071493; Thu, 18
 May 2023 01:37:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7108:3acc:b0:2fb:68dc:b886 with HTTP; Thu, 18 May 2023
 01:37:51 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly332@gmail.com>
Date:   Thu, 18 May 2023 01:37:51 -0700
Message-ID: <CAGYF=X4Ex_Y5wERRo-XSprWRfSW1RLz5CpLwHh1QAw4JwQaHkg@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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

Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
