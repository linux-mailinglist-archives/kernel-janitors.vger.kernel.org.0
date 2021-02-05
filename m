Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F1F3102C4
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Feb 2021 03:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbhBEC1a (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 4 Feb 2021 21:27:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhBEC12 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 Feb 2021 21:27:28 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C01C0613D6
        for <kernel-janitors@vger.kernel.org>; Thu,  4 Feb 2021 18:26:47 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id df22so6961267edb.1
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Feb 2021 18:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:sender:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=hqf55dXwvcYwwL4sAkoYuOM6RPu6wxeec88n5sMRYiY=;
        b=hRJWP+W8doJZLXviSxrNJLJjpJv9yq5WNTPIgdUmzdYardgEZ7Gs8+BJgqjiolejJy
         oG30XE6o6c+Ywsy5o/X3rFRDxZNbYwc/s/zY2IQFW5HO6Egjd896VULM9crhc3ZxthTQ
         a0qz/2XKjbavgTQcLkaVJdLGvBlGZWoIFcPy/0fMZK5iZes5+OLHcz9UdWXexjEQ4viF
         M1vquDJR78qKMxjhLZWDWM8RSim2SlKzTa+s1lSsgLayUafNxx6WsP3cG2wA1hgOUzXd
         j0zQB1qmn1IwT/x6YS322JL1b1EGWewI2x0Rex1T8jEnu/9bGmhsR42kplpC/rFiuCO6
         GNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:sender:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=hqf55dXwvcYwwL4sAkoYuOM6RPu6wxeec88n5sMRYiY=;
        b=hbELwIYA6HtNCsrp05ZU/En3DZtvgg9PvZsh73VcxuP5GQeJc+FFY8X5iOMtCN2izT
         sdNS5POvzdZGnDCb4MGnruVN9+PoSz2S6vqwu9ntp5ssPRrMV9uc1GaIkxPI9f0hYcZk
         JnaLoXROZWVj2Y+586/Q+hLTe7iEf50yeZEWKdzaIwDnAmo+sXEAZVhx5AYylEmOR/uF
         tiu/3gdLV9cmFRSAIWvYGSnwdJ7/j3MqM35vgWwsbo6djFY6kDQl+Gr8yPnC2igDst/r
         puIzmfAql1YWoBn9zBo4RrXwQ+y+Czt6SsWTfefJbsJCqMBlVOWL5yE6yxW+NxRGKoig
         C1Bg==
X-Gm-Message-State: AOAM532UVcUDRJ3Sc90NSrDW+ilpXiAk6NUTweIGwIhJKX6/b+c+/iNJ
        olzEPkA8BZlpHdsiLK4XB4Y=
X-Google-Smtp-Source: ABdhPJzJ7pB37VA+F2UTJ38b772yqqCaB6NfsXLHxABnjbX169bdgnjIm5pnHwGUg4dseUhW1gh1zQ==
X-Received: by 2002:a05:6402:1249:: with SMTP id l9mr1363359edw.375.1612492006609;
        Thu, 04 Feb 2021 18:26:46 -0800 (PST)
Received: from [192.168.1.6] ([154.124.28.35])
        by smtp.gmail.com with ESMTPSA id r23sm3228975ejd.56.2021.02.04.18.26.42
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Feb 2021 18:26:45 -0800 (PST)
Message-ID: <601cace5.1c69fb81.9923d.f21a@mx.google.com>
Sender: skylar anderson <unitedbankofafricaserviceuba@gmail.com>
From:   calantha camara <sgt.andersonskylar0@gmail.com>
X-Google-Original-From: calantha camara
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: hi dear
To:     Recipients <calantha@vger.kernel.org>
Date:   Fri, 05 Feb 2021 02:26:39 +0000
Reply-To: calanthac20@gmail.com
X-Mailer: cdcaafe51be8cdb99a1c85906066cad3d0e60e273541515a58395093a7c4e1f0eefb01d7fc4e6278706e9fb8c4dad093c3263345202970888b6b4d817f9e998c032e7d59
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

do you speak Eglish
